class EventsController < ApplicationController
  def index
    if params[:tag].present?
      @events = Event.published.order(created_at: :desc).tagged_with(params[:tag]).page(params[:page])
    elsif params[:q].present?
      @events = Event.published.order(created_at: :desc).search(params[:q]).page(params[:page])
    else
      @events = Event.published.order(created_at: :desc).page(params[:page])
    end
    @tags = ActsAsTaggableOn::Tag.all
  end

  def show
    @event = Event.find(params[:id])
    unless @event.published? || @event.frontend_editable?(session[:reported_events_ids], current_user)
      redirect_to events_path, notice: 'This event cannot be shown.'
    end
  end

  def new
    @event = Event.new
  end

  def edit
    @event = Event.find(params[:id])
    unless @event.frontend_editable?(session[:reported_events_ids], current_user)
      flash[:error] = 'Sorry, you cannot edit this event.'
      redirect_to events_path
    end
  end

  def create
    @event = Event.new(event_params)
    if  @event.save
      (session[:reported_events_ids] ||= []).push(@event.id)
      redirect_to @event, notice: 'Event was successfully created.'
    else
      flash[:error] = 'The event could not be saved.'
      render :new
    end
  end

  def update
    @event = Event.find(params[:id])
    unless @event.frontend_editable?(session[:reported_events_ids], current_user)
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
                                    :subtitle, 
                                    :date, 
                                    :city, 
                                    :country_code, 
                                    :description, 
                                    :main_url, 
                                    :speaker_list_url, 
                                    :contact_url, 
                                    :woman, 
                                    :total, 
                                    :reporter,
                                    :reporter_url, 
                                    :tag_list,
                                    :internal_user_info )
    end

  def tag_cloud
    @tags = Event.tag_counts_on(:tags)
  end
end
