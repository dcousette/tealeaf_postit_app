class PostsController < ApplicationController
  before_action :setup_post, only: [:show, :edit, :update ]
  
  def index
    @posts = Post.all 
  end

  def show
  end

  def new
    @post = Post.new 
  end 

  def create
    @post = Post.new(post_params)
    @post.creator = User.first ## Change to logged in user - once authentication setup 

    if @post.save
      flash[:notice] = "Your post was created successfully."
      redirect_to posts_path 
    else
      render :new 
    end 
  end 

  def edit 
  end 

  def update  
    if @post.update(post_params) 
      flash[:notice] = "Your post has been updated successfully."  
      redirect_to post_path(@post)
    else 
      render :edit
    end  
  end

  private

    def post_params 
      params.require(:post).permit(:title, :url, :description)
    end

    def setup_post
      @post = Post.find(params[:id])
    end 
end
