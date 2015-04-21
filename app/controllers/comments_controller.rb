class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(params.require(:comment).permit(:body))
    @comment.creator = User.first #fix this after authentication is setup 

    if @comment.save
      flash[:notice] = "Your comment was saved."
      redirect_to post_path(@post)
    else 
      render 'posts/show'
    end
  end
end
