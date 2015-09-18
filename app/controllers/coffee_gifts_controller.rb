class CoffeeGiftsController < ApplicationController

	before_action :authenticate_user
	before_action :authorize_user, only: [:show]

	def new
		@cafe = Cafe.find_by(id: params[:cafe_id])
		@menu_items = @cafe.menu_items
		@coffee_gift = CoffeeGift.new
	end	

	def create
		coffee_gift = current_user.given_coffees.build(coffee_gift_params)
		if coffee_gift.save
			text = TwilioTextSender.new(coffee_gift)
			text.send!
			redirect_to confirmation_path(coffee_gift)
		else
			flash[:error] = coffee_gift.errors.full_messages 
			redirect_to new_cafe_coffee_gift_path(@cafe)
		end	
	end

	def show
		find_coffee_gift
		@cafe = @coffee_gift.cafe
	end	

	def confirm
	end	
	
	private

	def find_coffee_gift
		@coffee_gift = CoffeeGift.find_by(id: params[:id])
	end	

	def authorize_user
		find_coffee_gift
		redirect_to root_path unless current_user.received_coffee?(@coffee_gift)
	end	

	def authenticate_user
		redirect_to root_path unless current_user
	end	

	def coffee_gift_basic_params
		params.require(:coffee_gift).permit(:message)
	end	

	def coffee_gift_params
		receiver = User.find_by(username: params[:coffee_gift][:receiver])
		menu_item = MenuItem.find_by(id: params[:coffee_gift][:menu_item])
		coffee_gift_basic_params.merge(receiver: receiver, menu_item: menu_item)
	end	

end	