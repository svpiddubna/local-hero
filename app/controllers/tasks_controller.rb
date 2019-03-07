class TasksController < ApplicationController

  def index

  end


  def show
    @task = Task.find(params[:id])
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
