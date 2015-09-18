class CoffeeGiftsController < ApplicationController

	before_action :authenticate_user
	before_action :authorize_user, only: [:show]
	before_action :find_cafe, except: [:new]

	def new
		@cafe = Cafe.find_by(id: params[:cafe_id])
		@menu_items = @cafe.menu_items
		@coffee_gift = CoffeeGift.new
	end	

	def create
		coffee_gift = current_user.given_coffees.build(coffee_gift_params)
		if coffee_gift.save
			binding.pry
			redirect_to root_path
		else
			flash[:error] = coffee_gift.errors.full_messages 
			redirect_to new_cafe_coffee_gift_path(@cafe)
		end	
	end

	def show
	end	
	
	private

	def find_cafe
		@cafe = Cafe.find_by(id: params[:cafe_id])
	end	

	def authorize_user
		redirect_to root_path unless current_user==@coffee_gift.receiver
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