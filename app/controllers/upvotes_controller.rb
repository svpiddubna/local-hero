class UpvotesController < ApplicationController
  # Increment given user votes by 1
  def update
    @user = User.find(params[:user_id])
    redirect_path = Rails.application.routes.recognize_path(params[:back_path])
    @user.upvote!
    redirect_to redirect_path, notice: "You endorsed a user and made them closer to hero status!"
  end
end
