class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params.merge(picture: Cloudinary::Uploader.upload("http://cdn.patch.com/assets/contrib/images/placeholder-user-photo.png")["public_id"]))
    if user.save
      log_in_user(user)
      user.find_associated_coffees
      redirect_to root_path
    else
      flash[:reg_error]=user.errors.full_messages
      redirect_to root_path
    end
  end

  def show
    authorize_user
    @user = current_user
    @given_coffees = @user.given_coffees
    @received_coffees = @user.received_coffees
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if params[:user]
      @user.update_attributes(user_params.merge(params[:user]))
    else
      flash[:error] = ["Something went wrong! Your picture was not uploaded"]
    end
    render :show
  end


  private

  def authorize_user
    redirect_to :root unless current_user
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :phone, :picture)
  end
end
