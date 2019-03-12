class EventsController < ApplicationController
  include Mappable
  include Localheroable
  layout "sidebar_layout", only: [:index]
  layout "sidebar_layout_show", only: [:show]
  def index
    @events = Event.order(created_at: :desc)
  end

  def show
    @event = Event.find(params[:id])
    @event_attendance = @event.attendances.find_by(user: current_user)
    @comment = Comment.new
    @post = @event.becomes(Post)
  end

  def new
    @event = Event.new
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

  def event_params
    params.require(:event).permit(:title, :photo, :content, :starts_at, :address)
  end
end
