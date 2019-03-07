class TasksController < ApplicationController
  def show
    @task = Task.find(params[:id])
    @comment = Comment.new
    @post = @task.becomes(Post)
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.user = current_user
    @task.save
  end

  private

  def task_params
    params.require(:task).permit(:title, :content)
  end
end
