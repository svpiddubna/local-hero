class QuestionsController < ApplicationController
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
    @question.save
  end

  private

  def question_params
    params.require(:question).permit(:title, :content)
  end
end
