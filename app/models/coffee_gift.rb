class CoffeeGift < ActiveRecord::Base
	belongs_to :menu_item
	belongs_to :receiver, class_name: :User
	belongs_to :giver, class_name: :User

	delegate :name, to: :menu_item

	def sanitize_params(params)
		receiver = User.find_by(username: params[:coffee_gift][:receiver])
		menu_item = MenuItem.find_by(id: params[:coffee_gift][:menu_item])
		coffee_gift_params.merge(receiver: receiver, menu_item: menu_item)
	end	
end
