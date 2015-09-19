class CafeSessionsController < ApplicationController
  def new
    @cafe = Cafe.new
  end

  def create
    @cafe = Cafe.find_by(username: cafe_session_params[:username])
    if @cafe && @cafe.authenticate(cafe_session_params[:password])
      log_in_cafe(@cafe)
      redirect_to cafes_profile_path
    elsif cafe
      flash[:password_error] = "Incorrect password"
      render :new
    else
      @cafe = Cafe.new(cafe_session_params)
      flash[:auth_error] = "Username not found"
      render :new
    end
  end

  def destroy
    log_out_cafe
    flash[:notice] = "You have successfully logged out."
    redirect_to cafes_login_path
  end

  private

  def cafe_session_params
    params.require(:cafe_session).permit(:username, :password)
  end

end
