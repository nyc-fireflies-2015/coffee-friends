class UserSessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: user_session_params[:email])
    if @user && @user.authenticate(user_session_params[:password])
      log_in_user(@user)
    elsif @user
      flash[:password_error] = "Incorrect password"
    else
      @user = User.new(user_session_params)
      flash[:auth_error] = "Email not found"
    end
    redirect_to root_url
  end

  def destroy
    log_out_user
    redirect_to root_path
  end

  private

  def user_session_params
    params.require(:user_session).permit(:email, :password)
  end
end

