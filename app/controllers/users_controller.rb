class UsersController < ApplicationController
  before_action :setup_user, only: [:edit, :show, :update]
  before_action :require_same_user, only: [:edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
  
    if @user.save 
      flash[:notice] = "Your new User was created successfully."
      session[:user_id] = @user.id 
      redirect_to posts_path 
    else
      render 'new'
    end
  end

  def edit
  end 

  def update
    if @user.update(user_params)
      flash[:notice] = 'Your profile was updated.'
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end

  def show
  end

  private 

  def user_params
    params.require(:user).permit(:username, :password, :time_zone)
  end

  def setup_user
    @user = User.find_by(slug: params[:id])
  end

  def require_same_user #only allow edit or update your own profile 
    if current_user != @user 
      flash[:error] = "You can't do that!"
      redirect_to root_path 
    end
  end
end
