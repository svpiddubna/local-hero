class QuestionsController < ApplicationController
  before_action :localheroes, only: [:index, :show]

  def index
    @questions = Question.all.order(created_at: :desc)
    map_markers
    render layout: "sidebar_layout"
  end

  def show
    @question = Question.find(params[:id])
    @comment = Comment.new
    # For a comment form
    @post = @question.becomes(Post)
    map_markers
    render layout: "sidebar_layout"
  end

  def new
    @question = Question.new
    map_markers
  end

  def create
    @question = Question.new(question_params)
    @question.user = current_user
    if @question.save
      redirect_to question_path(@question)
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

  def question_params
    params.require(:question).permit(:title, :content)
  end

  def localheroes
    # Methods for retrieving top and most recent localheroes
    @top_localheroes = User.order('votes DESC').limit(3)
    @recent_localheroes = User.order('created_at DESC').limit(3)
  end
end
