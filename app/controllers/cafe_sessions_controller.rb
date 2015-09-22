class CafeSessionsController < ApplicationController
  def new
    @cafe = Cafe.new
  end

  def create
    @cafe = Cafe.find_by(email: cafe_session_params[:email])
    if @cafe && @cafe.authenticate(cafe_session_params[:password])
      log_in_cafe(@cafe)
      redirect_to cafes_profile_path
    else
      flash[:cafe_error] = "Incorrect email or password"
      redirect_to root_path
    end
  end

  def destroy
    log_out_cafe
    redirect_to root_path
  end

  private

  def cafe_session_params
    params.require(:cafe_session).permit(:email, :password)
  end

end
