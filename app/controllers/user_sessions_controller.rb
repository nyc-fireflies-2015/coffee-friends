class UserSessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: user_session_params[:username])
    if user && user.authenticate(user_session_params[:password])
      log_in_user(user)
      flash[:notice] = "Login Successful!"
      redirect_to root_url 
    else
      flash[:error] = ['Username/Password combination is incorrect']
      redirect_to login_path
    end
  end

  def destroy
    log_out_user
    flash[:notice] = "You have successfully logged out."
    redirect_to login_path
  end

  private

  def user_session_params
    params.require(:user_session).permit(:username, :password)
  end
end
