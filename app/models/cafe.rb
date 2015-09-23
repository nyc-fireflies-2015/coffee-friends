class Cafe < ActiveRecord::Base
	has_secure_password
	has_many :menu_items
	has_many :coffee_gifts, through: :menu_items

	validates_presence_of :name, :address, :email
	validates :email, :name, length: {maximum: 50}
	validates :address, length: {maximum: 150}
	validates_email_format_of :email, message: "is not in the correct format"
  validates_uniqueness_of :email
	validates :password, :presence => true, :length => {minimum: 6}, :on => :create

	before_save :generate_slug

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

	def self.filter_by_borough(tag)
		self.all.where(borough: tag)
	end

	def self.filter_by_neighborhood(tag)
		self.all.where(neighborhood: tag)
	end

	def search_non_charitable_gifts(search)
  	self.unredeemed_coffee_gifts.where("redemption_code LIKE ? AND charitable = ?", "%#{search}%", false)
	end

	def charitable_gifts
		coffee_gifts.where(charitable: true)
	end

	def unredeemed_charitable_gifts
		coffee_gifts.where(charitable: true, redeemed: false)
	end

	def to_param
    slug
  end

	private

	def generate_slug
		self.slug = self.name.parameterize
	end

end
