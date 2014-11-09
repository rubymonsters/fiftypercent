class EventsController < ApplicationController
  before_action :authenticate, only: [:create, :update, :destroy]
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    if params[:tag].present?
      @events = Event.published.tagged_with(params[:tag]).page(params[:page])
    elsif params[:q].present?
      @events = Event.published.search(params[:q]).page(params[:page])
    else
      @events = Event.published.order(:created_at).page(params[:page])
    end
    @tags = ActsAsTaggableOn::Tag.all
  end

  def show
  end

  def new
    @event = Event.new
  end

  def edit
  end

  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end

  end

  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:title, :subtitle, :date, :city, :country_code, :description, :main_url, :speaker_list_url, :contact_url, :woman, :total, :reporter, :reporter_url, :tag_list )
    end

  def tag_cloud
    @tags = Event.tag_counts_on(:tags)
  end

  protected

    def authenticate
      current_user
    end

end
