class SessionsController < ApplicationController

  before_action :logged_in_redirect, only: [:new, :create]

  def new
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      Rails.logger.debug "session #{session[:user_id]}"
      flash[:success] = "Successfully logged in"
      redirect_to root_path
    else
      #flash.now has to be used instead of flash.notice because it requires a 1 cycle request
      flash.now[:error] = "There was something wrong with your login information"
      render 'new'
    end
  end

  def destroy
    #for when the user logs out, deletes the user session
    session[:user_id] = nil
    flash[:sucess] = "You have successfully logged out"
    redirect_to login_path
  end

  private

  def logged_in_redirect
    if logged_in?
      flash[:error] = "You are already logged in"
      redirect_to root_path
    end
  end


end
