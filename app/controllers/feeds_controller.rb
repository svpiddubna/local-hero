class FeedsController < ApplicationController
  def index
    @posts = Post.all.order(created_at: :desc)
    @events = Event.all.order(created_at: :desc)
    @questions = Question.all.order(created_at: :desc)
    @tasks = Task.all.order(created_at: :desc)

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
    render layout: "sidebar_layout"
  end

  def user_index
    @user_posts = Post.where(user: current_user)
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
    render layout: "sidebar_layout"
  end
end
