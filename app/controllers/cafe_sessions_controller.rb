class CafeSessionsController < ApplicationController
  def new
  end

  def create
    cafe = Cafe.find_by(username: cafe_session_params[:username])
    if cafe && cafe.authenticate(cafe_session_params[:password])
      log_in_cafe(cafe)
      redirect_to cafe_path(cafe)
    else
      redirect_to cafe_login_path, flash: {error: 'Username/Password combination is incorrect'}
    end
  end

  def destroy
    log_out_cafe
    flash[:notice] = "You have successfully logged out."
    redirect_to cafe_login_path
  end

  private

  def cafe_session_params
    params.require(:cafe_session).permit(:username, :password)
  end

end
