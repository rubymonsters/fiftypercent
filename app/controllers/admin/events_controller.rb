class Admin::EventsController < Admin::BaseController

  def index
    @events = Event.order(:created_at).page(params[:page])
  end

end