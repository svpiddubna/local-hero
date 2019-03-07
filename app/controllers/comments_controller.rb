class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    @comment.post = @post
    @comment.user = current_user
    @comment.save
    if @post.type == "Event"
      redirect_to event_path(@post)
    elsif @post.type == "Task"
      redirect_to task_path(@post)
    else
      redirect_to question_path(@post)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
