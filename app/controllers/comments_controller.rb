class CommentsController < ApplicationController
  before_action :require_user

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(params.require(:comment).permit(:body))
    @comment.creator = @current_user

    if @comment.save
      flash[:notice] = "Your comment was saved."
      redirect_to post_path(@post)
    else 
      render 'posts/show'
    end
  end

  def vote
    comment = Comment.find(params[:id])
    Vote.create(voteable: comment, creator: current_user, value: params[:value])
    flash[:notice] = "Your vote was added"
    redirect_to :back
  end 
end

