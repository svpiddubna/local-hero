class QuestionsController < ApplicationController
  include Mappable
  include Localheroable
  layout "sidebar_layout", only: [:index, :show]

  def index
    @questions = Question.all.order(created_at: :desc)
  end

  def show
    @question = Question.find(params[:id])
    @comment = Comment.new
    # For a comment form
    @post = @question.becomes(Post)
  end

  def new
    @question = Question.new
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

  def question_params
    params.require(:question).permit(:title, :content)
  end
end
