class CommentsController < ApplicationController
  # Use mappable and localheroable concerncs
  include Mappable
  include Localheroable
  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    @comment.post = @post
    @comment.user = current_user

    if @comment.save
      @comment.notify!(current_user)
      redirect_to helpers.determine_post_path(@post)
    else
      rerender_original_show
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def rerender_original_show
    type = @post.type
    # Metaprogramming magic
    instance_variable_set "@#{type.downcase}",
                          @post.becomes(type.safe_constantize)
    @post = @post.becomes(Post) # ensure type for generic comment form
    localheroes # Use concern instead of method duplication
    render params[:origin_view], layout: "sidebar_layout_show"
  end
end
