class NotificationsController < ApplicationController
  def update
    @notification = Notification.find(params[:id])
    @notification.update(read: true)
    redirect_to helpers.determine_post_path(@notification.post)
  end
end
