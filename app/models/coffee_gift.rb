class CoffeeGift < ActiveRecord::Base
	belongs_to :menu_item
	belongs_to :receiver, class_name: :User
	belongs_to :giver, class_name: :User

	before_save :set_phone_num

	delegate :name, to: :menu_item
	delegate :cafe, to: :menu_item

	private

	def set_phone_num
		self.phone ||= receiver.phone
	end	
end
