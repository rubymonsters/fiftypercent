class EventsController < ApplicationController
  def index
    if params[:tag].present?
      @events = Event.published.tagged_with(params[:tag])
    elsif params[:q].present?
      @events = Event.published.search(params[:q])
    else
      @events = Event.published
    end

    case params[:order_by]
    when 'created_at'
      @events = @events.order(created_at: :desc)
    when 'date'
      @events = @events.order(date: :desc)
    else
      @events = @events.order(created_at: :desc)
    end

    @events = @events.includes(:comments).page(params[:page])

    @tags = ActsAsTaggableOn::Tag.all
    @all_events = Event.published.order(date: :desc).all
    respond_to do |format|
      format.html
      format.json { render json: @all_events.as_json }
      format.csv { send_data @all_events.to_csv }
    end

  end

  def show
    @event   = Event.includes(:comments).find(params[:id])
    @comment = Comment.new
    unless @event.published? || @event.frontend_editable?(session[:reported_events_ids])
      redirect_to events_path, notice: 'This event cannot be shown.'
    end
  end

  def new
    @event = Event.new
  end

  def edit
    @event = Event.find(params[:id])
    unless @event.frontend_editable?(session[:reported_events_ids])
      flash[:error] = 'Sorry, you cannot edit this event.'
      redirect_to events_path
    end
  end

  def create
    @event = Event.new(event_params)
    if  @event.save
      (session[:reported_events_ids] ||= []).push(@event.id)
      redirect_to @event, notice: 'Event was successfully created.'
      NotificationsMailer.new_event(@event).deliver_now
    else
      flash[:error] = 'The event could not be saved.'
      render :new
    end
  end

  def update
    @event = Event.find(params[:id])
    unless @event.frontend_editable?(session[:reported_events_ids])
      flash[:error] = 'Sorry, you cannot edit this event.'
      redirect_to events_path
    end
    if @event.update(event_params)
      redirect_to @event, notice: 'Event was successfully updated.'
    else
      render :edit
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:title,
                                    :date,
                                    :city,
                                    :country_code,
                                    :description,
                                    :main_url,
                                    :organizers,
                                    :speaker_list_url,
                                    :contact_url,
                                    :contact_twitter,
                                    :contact_email,
                                    :woman,
                                    :total,
                                    :remark,
                                    :reporter,
                                    :reporter_url,
                                    :reporter_twitter,
                                    :reporter_email,
                                    :tag_list,
                                    :internal_user_info )
    end

  def tag_cloud
    @tags = Event.tag_counts_on(:tags)
  end

end
