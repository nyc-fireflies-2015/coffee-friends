class CoffeeGiftsController < ApplicationController

	before_action :authenticate_user
	before_action :authorize_user, only: [:show]

	def new
		@cafe = Cafe.find_by(id: params[:cafe_id])
		@menu_items = @cafe.menu_items
		@coffee_gift = CoffeeGift.new
	end	

	def create
		#authorize user
		coffee_gift = current_user.given_coffees.build(coffee_gift_params)
		flash[:error] = coffee_gift.errors.full_messages unless coffee_gift.save

	end

	def show
	end	
	
	private

	def authorize_user
		redirect_to root_path unless current_user==@coffee_gift.receiver
	end	

	def authenticate_user
		redirect_to root_path unless current_user
	end	

	def coffee_gift_params
		params.require(:coffee_gift).permit(:message, :menu_item, :receiver)
	end	

end	