class FeedsController < ApplicationController
  def index

    # Core methods

    @posts = Post.all.order(created_at: :desc)
    @events = Event.all.order(created_at: :desc)
    @questions = Question.all.order(created_at: :desc)
    @tasks = Task.all.order(created_at: :desc)

    # Methods for retrieving top and most recent localheroes
    @top_localheroes = User.order('votes DESC').limit(3)
    @recent_localheroes = User.order('created_at DESC').limit(3)

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
