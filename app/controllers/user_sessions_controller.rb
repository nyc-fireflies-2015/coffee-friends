class UserSessionsController < ApplicationController
  def new
  end

  def create
    #make sure to add this route
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      log_in(user)
      redirect_to root_url, notice: "Login Successful!"
    else
      redirect_to login_path, flash: {error: 'Username/Password combination is incorrect'}
    end
  end

  def destroy
    log_out
    flash[:notice] = "You have successfully logged out."
    redirect_to login_path
  end
end
