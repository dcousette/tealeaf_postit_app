class SessionsController < ApplicationController
  def new
    #render the login form 
  end

  def create
    #find the user in db that matches user in login form
    #match the passed in pw to the password digest in database
    #if successful 
      #flash user login success
      #save user id to session cookie 
      #redirect_to desired location
    #else 
      #flash error messsage 
      #re render login page
    user = User.find_by(username: params[:username])
    
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id 
      flash[:notice] = 'You are now logged in.'
      redirect_to posts_path
    else
      flash[:error] = "Please enter the correct username and password."
      render 'new'
    end
  end

  def destroy
    #remove user_id from session cookie
    #flash user logout message
    #redirect_to desired location
    session[:user_id] = nil 
    flash[:notice] = 'You have logged out successfully.'
    redirect_to root_path
  end
end
