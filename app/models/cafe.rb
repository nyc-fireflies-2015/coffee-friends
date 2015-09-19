class Cafe < ActiveRecord::Base
	has_secure_password
	has_many :menu_items
	has_many :coffee_gifts, through: :menu_items

	validates_presence_of :name, :address, :username, :email
	validates :username, length: {maximum: 20}
	validates :email, :name, length: {maximum: 50}
	validates :address, length: {maximum: 150}
	validates_email_format_of :email, message: "is not in the correct format"
  validates_uniqueness_of :email, :username
	validates :password, :presence => true, :length => {minimum: 6}, :on => :create

	def owns_item?(menu_item)
		self == menu_item.cafe
	end

	def owner?(current_cafe)
		self == current_cafe
	end

	def unredeemed_coffee_gifts
		self.coffee_gifts.where('redeemed = ?', false)
	end

	def redeemed_coffee_gifts
		self.coffee_gifts.where('redeemed = ?', true)
	end
end
