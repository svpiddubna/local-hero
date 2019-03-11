class TasksController < ApplicationController
  layout "sidebar_layout", only: [:index, :show]

  before_action :set_task, only: [:update, :show]


  def index
    @tasks = Task.all.order(created_at: :desc)
    map_markers
  end


  def update
    @task.update(done: true)
    redirect_to task_path(@task)
  end


  def show
    @comment = Comment.new
    @post = @task.becomes(Post)
    map_markers
  end

  def new
    @task = Task.new
    map_markers
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

  def map_markers
    if current_user.latitude && current_user.longitude
      @markers = [{ lng: current_user.longitude, lat: current_user.latitude }]
    else
      @markers = []
    end
  end

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :content, :photo)
  end
end
