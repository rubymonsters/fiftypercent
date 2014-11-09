class Admin::EventsController < Admin::BaseController

  before_action :set_event, only: [:show, :edit, :update, :destroy, :publish, :unpublish]

  def index
    @unpublished_events = Event.unpublished.order(:created_at)

    if params[:tag].present?
      @events = Event.order(created_at: :desc).tagged_with(params[:tag]).page(params[:page]).per(40)
    elsif params[:q].present?
      @events = Event.order(created_at: :desc).search(params[:q]).page(params[:page]).per(40)
    else
      @events = Event.order(created_at: :desc).page(params[:page]).per(40)
    end
  end

  def show
  end

  def edit
  end


  def update
    if @event.update(event_params)
      redirect_to admin_event_path(@event)
    else
      render 'edit'
    end
  end

  def destroy
    @event.destroy
    redirect_to admin_events_path
  end

  def publish
    @event.update_attributes(published_at: Time.now)
    redirect_to admin_events_path
  end

  def unpublish
    @event.update_attributes(published_at: nil)
    redirect_to admin_events_path
  end

  private
    def event_params
      params.require(:event).permit!
    end
    
    def set_event
      @event = Event.find(params[:id])
    end
end