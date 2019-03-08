class QuestionsController < ApplicationController

  def index
    @questions = Question.all
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
end
