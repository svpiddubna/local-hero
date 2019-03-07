class FeedsController < ApplicationController
  def index
    @posts = Post.all
    @events = Event.all
    @questions = Question.all
    @tasks = Task.all

    @users = User.where.not(latitude: nil, longitude: nil)
    @markers = @users.map do |user|
      {
        lng: user.longitude,
        lat: user.latitude
      }
  end
end
end
