class UsersController < ApplicationController

  before_action :authorize_user, only: [:show]

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      log_in_user(user)
      user.find_associated_coffees
      redirect_to root_path
    else
      # display error on main page
      redirect_to root_path
    end
  end

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if params[:user]
      @user.update_attributes(user_params.merge(params[:user]))
    else
      flash[:error] = ["Something Went Wrong! Your Picture Was Not Uploaded"]
    end
    render :show
  end


  private

  def authorize_user
    redirect_to root_url unless current_user
  end  

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :phone, :picture)
  end
end
