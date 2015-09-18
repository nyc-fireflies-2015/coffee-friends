class CoffeeGift < ActiveRecord::Base
	include TwilioTextSender
	
	belongs_to :menu_item
	belongs_to :receiver, class_name: :User
	belongs_to :giver, class_name: :User

	delegate :name, to: :menu_item
end
