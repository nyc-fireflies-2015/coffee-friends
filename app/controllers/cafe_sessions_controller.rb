class CafeSessionsController < ApplicationController
  def new
  end

  def create
    cafe = Cafe.find_by(username: params[:session][:username])
    if cafe && cafe.authenticate(params[:session][:password])
      log_in_cafe(cafe)
      redirect_to cafes_profile_path
    else
      redirect_to cafe_login_path, flash: {error: 'Username/Password combination is incorrect'}
    end
  end

  def destroy
    log_out_cafe
    flash[:notice] = "You have successfully logged out."
    redirect_to cafe_login_path
  end

end
