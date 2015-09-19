class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in_user(@user)
      binding.pry
      if coffee_gifts = CoffeeGift.find_by(phone: params[:phone])
        binding.pry
        @user.coffee_gifts << coffee_gifts
      end  
      binding.pry
      flash[:notice] = "Account has been created!!"
      redirect_to root_path
    else
      flash[:error] = @user.errors.full_messages
      render :new
    end
  end

  def show
    @user = current_user
    @unredeemed_coffee_gifts = @user.received_coffees.where('redeemed = ?', false)
    @redeemed_coffee_gifts = @user.received_coffees.where('redeemed = ?', true)
  end


  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :phone)
  end
end
