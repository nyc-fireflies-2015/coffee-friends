class User < ActiveRecord::Base
	has_secure_password

	has_many :given_coffees, class_name: :CoffeeGift, foreign_key: :giver_id
	has_many :received_coffees, class_name: :CoffeeGift, foreign_key: :receiver_id

	before_save :extract_username

	validates_presence_of :email, :phone, :first_name, :last_name
	validates_presence_of :username, :on => :save
	validates_uniqueness_of :username, :email, :phone, :on => :save
	validates :username, length: {maximum: 50}, :on => :save
	validates_length_of :phone, :is => 10
	validates :first_name, length: {maximum: 25}
	validates :last_name, length: {maximum: 25}
	validates :email, length: {maximum: 50}
	validates_email_format_of :email, message: "is not in the correct format"
	validates_format_of :phone, with: /\d{10}/, message: "is not in the correct format"
	validates :password, :presence => true, :length => {minimum: 6}, :on => :create

	def reward
		##what will this return?
	end

	def received_coffee?(coffee_gift)
		self == coffee_gift.receiver
	end

	def unredeemed_coffee_gifts
		self.received_coffees.where('redeemed = ?', false)
	end

	def redeemed_coffee_gifts
		self.received_coffees.where('redeemed = ?', true)
	end

	def find_associated_coffees
	  received_coffees << coffee_gift if coffee_gift = CoffeeGift.find_by(phone: phone)
	end

	def full_name
		[first_name, last_name].join(" ")
	end	

	private

	def extract_username
		self.username = self.email.split('@').first
	end

end
