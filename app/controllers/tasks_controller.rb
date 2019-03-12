class TasksController < ApplicationController
  include Mappable
  layout "sidebar_layout", only: [:index, :show]
  before_action :set_task, only: [:update, :show]
  before_action :localheroes, only: [:index, :show]

  def index
    @tasks = Task.all.order(created_at: :desc)
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
      redirect_to task_path(@task)
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

  def localheroes
    # Methods for retrieving top and most recent localheroes
    @top_localheroes = User.order('votes DESC').limit(3)
    @recent_localheroes = User.order('created_at DESC').limit(3)
  end
end
