class SessionsController < ApplicationController
   before_action :logged_in_redirect, only: [:new, :create]
  def new
  end

  def create
    @user = User.find_by(username: params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      #Good scenario
      session[:user_id] = @user.id
      flash[:success] = "You've successfully logged in"
      redirect_to root_path
    else
      #user is invalid or auth failed
      flash.now[:danger] = "There was somenthing wrong with your login information"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "You've successfully logged out"
    redirect_to login_path
  end
  
  private

  def logged_in_redirect
    if logged_in?
      flash[:warning] = "You're already logged in"
      redirect_to root_path
    end
  end
  
  
end
