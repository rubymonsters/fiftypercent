class Admin::EventsController < Admin::BaseController

  before_action :set_event, only: [:show, :edit, :update, :destroy, :publish, :hide, :uncheck]

  def index
    if params[:q].present?
      @events = Event.search(params[:q])
    else
      @events = Event.all
    end

    case params[:mod_state]
    when 'unchecked'
      @events = @events.unchecked
    when 'published'
      @events = @events.published
    when 'hidden'
      @events = @events.hidden
    end

    @events = @events.includes(:comments).order(created_at: :desc).page(params[:page]).per(40)
  end

  def update
    @event.attributes = event_params
    if @event.save(validate: false)
      redirect_to admin_event_path(@event), flash: {success: "Successfully updated event: <strong>\"#{@event.title}\"</strong>"}
    else
      render 'edit'
    end
  end

  def destroy
    @event.destroy
    redirect_to admin_events_path, flash: {success: "Successfully deleted event: <strong>\"#{@event.title}\"</strong>"}
  end

  def publish
    @event.update_attributes(mod_state: 'ok')
    respond_to do |format|
      format.html {redirect_to admin_event_path(@event), flash: {success: "Successfully <strong>published</strong> event: <strong>\"#{@event.title}\"</strong>"}}
      format.js {}
    end
  end

  def hide
    @event.update_attributes(mod_state: 'hidden')
    respond_to do |format|
      format.html {redirect_to admin_event_path(@event), flash: {success: "Successfully <strong>hid</strong> event: <strong>\"#{@event.title}\"</strong>"}}
      format.js {}
    end
  end

  def uncheck
    @event.update_attributes(mod_state: nil)
    respond_to do |format|
      format.html {redirect_to admin_event_path(@event), flash: {success: "Successfully <strong>un-published</strong> event: <strong>\"#{@event.title}\"</strong>"}}
      format.js {}
    end
  end

  private
    def event_params
      params.require(:event).permit!
    end

    def set_event
      @event = Event.find(params[:id])
    end
end