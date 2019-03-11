class EventsController < ApplicationController
  include NotificationMarkAsReadable

  def index
    @events = Event.all.order(created_at: :desc)
    map_markers
    render layout: "sidebar_layout"
  end

  def show
    @event = Event.find(params[:id])
    @event_attendance = @event.attendances.find_by(user: current_user)
    @comment = Comment.new
    @post = @event.becomes(Post)
    map_markers
    render layout: "sidebar_layout"
  end

  def new
    @event = Event.new
    map_markers
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    if @event.save
      redirect_to event_path(@event)
    else
      render :new
    end
  end

  private

  def map_markers
    if current_user.latitude && current_user.longitude
      @markers = [{ lng: current_user.longitude, lat: current_user.latitude }]
    else
      @markers = []
    end
  end

  def event_params
    params.require(:event).permit(:title, :photo, :content, :starts_at, :address)
  end
end
