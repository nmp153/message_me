class ApplicationController < ActionController::Base

  helper_method :current_user
  helper_method :logged_in?

  def current_user
    #this memoziation method:
    #It means if @current_user is nil (or false) then try to find it by id and assign it to @current_user, otherwise do nothing.
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  #this method will check if we have user that is logged in or not
  def logged_in?
    #!! means we are turning the @current_user instance variable into a boolean
    !!current_user
  end

  #this method we will check if the user is logged in, if not we will redirect them to login/signup page
  def require_user
    if !logged_in?
      flash[:error] = "You must be logged in to continue"
      redirect_to login_path
    end
  end
end
