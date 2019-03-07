class FeedsController < ApplicationController
  def index
    @posts = Post.all
    @events = Event.all
    @questions = Question.all
    @tasks = Task.all

    @user = User.where.not(latitude: nil, longitude: nil)
    @marker = @users.map do |user|
      {
        lng: flat.longitude,
        lat: flat.latitude
      }

  end
end



    @flats = Flat.where.not(latitude: nil, longitude: nil)

    @markers = @flats.map do |flat|
      {
        lng: flat.longitude,
        lat: flat.latitude
      }
