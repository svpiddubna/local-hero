class FeedsController < ApplicationController
  include Mappable
  before_action :localheroes, only: [:index, :show, :user_index]
  layout "sidebar_index"

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
  end

  private

  def localheroes
    # Methods for retrieving top and most recent localheroes
    @top_localheroes = User.order('votes DESC').limit(3)
    @recent_localheroes = User.order('created_at DESC').limit(3)
  end
end
