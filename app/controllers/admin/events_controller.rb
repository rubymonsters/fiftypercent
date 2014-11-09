class Admin::EventsController < Admin::BaseController

  def index
    @unpublished_events = Event.unpublished.order(:created_at)

    if params[:tag].present?
      @events = Event.order(:created_at).tagged_with(params[:tag]).page(params[:page])
    elsif params[:q].present?
      @events = Event.order(:created_at).search(params[:q]).page(params[:page])
    else
      @events = Event.order(:created_at).page(params[:page])
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def publish
    @event = Event.find(params[:id])
    @event.update_attributes(published_at: Time.now)
    redirect_to admin_events_path
  end

  def unpublish
    @event = Event.find(params[:id])
    @event.update_attributes(published_at: nil)
    redirect_to admin_events_path
  end

end