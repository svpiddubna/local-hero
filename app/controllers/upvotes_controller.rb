class UpvotesController < ApplicationController
  # Increment given user votes by 1
  def update
    @user = User.find(params[:id])
    redirect_path = Rails.application.routes.recognize_path(params[:back_path])
    @user.upvote!
    redirect_to redirect_path
  end
end
