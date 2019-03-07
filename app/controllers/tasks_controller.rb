class TasksController < ApplicationController

  before_action :set_task, only: [:update, :show]


  def index
    @tasks = Task.all
  end


  def update
    @task.update(done: true)
    redirect_to task_path(@task)
  end


  def show
    @comment = Comment.new
    @post = @task.becomes(Post)
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.user = current_user
    if @task.save
      redirect_to task(@task)
    else
      render :new
    end
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :content, :photo)
  end
end
