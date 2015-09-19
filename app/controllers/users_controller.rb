class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in_user(@user)
      redirect_to root_path, notice: "Account has been Created!!"
    else
      flash[:error] = @user.errors.full_messages
      render :new
    end
  end

  def show
    @user = current_user
  end


  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :phone)
  end
end
