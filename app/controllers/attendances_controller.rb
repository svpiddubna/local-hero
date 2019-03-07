class AttendancesController < ApplicationController
  def create
    @attendance = Attendance.new
    @attendance.post = Post.find(params[:event_id])
    @attendance.user = current_user
    @attendance.save
    redirect_to event_path(@attendance.post.becomes(Event))
  end

  def destroy
    @attendance = Attendance.find(params[:id])
    @attendance.destroy
    redirect_to event_path(@attendance.post.becomes(Event))
  end
end
