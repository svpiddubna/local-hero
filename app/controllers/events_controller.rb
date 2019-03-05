class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    @event.save
  end

  private

  def event_params
    params.require(:event).permit(:title, :content, :starts_at, :address)
  end
end
