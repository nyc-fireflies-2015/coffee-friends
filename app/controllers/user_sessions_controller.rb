class UserSessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:user_session][:username])
    if user && user.authenticate(params[:user_session][:password])
      log_in_user(user)
      redirect_to root_url, notice: "Login Successful!"
    else
      redirect_to login_path, flash: {error: 'Username/Password combination is incorrect'}
    end
  end

  def destroy
    log_out_user
    flash[:notice] = "You have successfully logged out."
    redirect_to login_path
  end
end
