class EventsController < ApplicationController
  layout "sidebar_layout", only: [:index, :show]
  before_action :localheroes, only: [:index, :show]

  def index
    @events = Event.order(created_at: :desc)
    @allevents = @events.near([current_user.latitude, current_user.longitude], 1)
    @eventmarkers = @allevents.map do |event|
      {
        lng: event.longitude,
        lat: event.latitude,
        infoWindow:  render_to_string(partial: 'shared/infowindow', locals: { event: event })
      }
    end
    map_markers
  end

  def show
    @event = Event.find(params[:id])
    @event_attendance = @event.attendances.find_by(user: current_user)
    @comment = Comment.new
    @post = @event.becomes(Post)
    map_markers
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

  def localheroes
    # Methods for retrieving top and most recent localheroes
    @top_localheroes = User.order('votes DESC').limit(3)
    @recent_localheroes = User.order('created_at DESC').limit(3)
  end
end
