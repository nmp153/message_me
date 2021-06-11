class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    Rails.logger.debug "userrr: #{@user.errors.full_messages}"
    if @user.save
      flash[:sucess] = "Welcome To Message Me #{@user.username}"
      redirect_to login_path
    else
      render 'new'
    end
  end


  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

end
