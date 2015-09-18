class CoffeeGiftsController < ApplicationController

	def new
		@cafe = Cafe.find_by(id: params[:cafe_id])
		@menu_items = @cafe.menu_items
		@coffee_gift = CoffeeGift.new
	end	

	def create

	end

	def show
	end	
	
	private

	def coffee_gift_params
	end	

end	