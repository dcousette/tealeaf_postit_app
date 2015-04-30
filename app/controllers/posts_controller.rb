class PostsController < ApplicationController
  before_action :setup_post, only: [:show, :edit, :update, :vote ]
  before_action :require_user, except: [:index, :show]
  
  def index
    @posts = Post.all 
  end

  def show
    @comment = Comment.new
  end

  def new
    @post = Post.new 
  end 

  def create
    @post = Post.new(post_params)
    @post.creator = current_user

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

  def vote
    @post.vote = Vote.new(value: params[:value])

    if @post.vote.save 
      flash[:notice] = 'Vote added.'
      redirect  
    else
      render :index
    end
    #create vote object with values from form submission 
    #if vote save 
      #flash?
      #redirect to somewhere 
    #else 
      #flash error message
      #stay on page
      #
  end

  private

    def post_params 
      params.require(:post).permit(:title, :url, :description, category_ids: [])
    end

    def setup_post
      @post = Post.find(params[:id])
    end 
end
