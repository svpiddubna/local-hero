class FeedsController < ApplicationController
  def index
    @posts = Post.all
    @events = Event.all
    @questions = Question.all
    @tasks = Task.all

    @users = User.where.not(latitude: nil, longitude: nil)
    # @markers = @users.map do |user|
    #   {
    #     lng: user.longitude,
    #     lat: user.latitude
    #   }
    # end
    if current_user.latitude && current_user.longitude
      @markers = [{ lng: current_user.longitude, lat: current_user.latitude }]
    else
      @markers = []
    end
  end
end
