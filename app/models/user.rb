class User < ActiveRecord::Base
	has_secure_password

	has_many :given_coffees, class_name: :CoffeeGift, foreign_key: :giver_id
	has_many :received_coffees, class_name: :CoffeeGift, foreign_key: :receiver_id

	validates_presence_of :email, :phone, :first_name, :last_name
	validates_presence_of :username, :on => :save
	validates_uniqueness_of :username, :email, :phone, :on => :save
	validates_length_of :username, :email, maximum: 50, :on => :save
	validates_length_of :phone, is: 10
	validates_length_of :first_name, :last_name, maximum: 25
	validates_email_format_of :email, message: "is not in the correct format"
	validates_format_of :phone, with: /\d{10}/, message: "is not in the correct format"
	validates :password, :presence => true, :length => {minimum: 6}, :on => :create

	before_save :extract_username, :downcase_names

	def received_coffee?(coffee_gift)
		self == coffee_gift.receiver
	end

	def sent_or_received_coffee?(coffee_gift)
		self == coffee_gift.giver || self == coffee_gift.receiver
	end

	def unredeemed_coffee_gifts
		self.received_coffees.where('redeemed = ?', false)
	end

	def redeemed_coffee_gifts
		self.received_coffees.where('redeemed = ?', true)
	end

	def find_associated_coffees
		coffee_gift = CoffeeGift.find_by(phone: phone)
	  received_coffees << coffee_gift if coffee_gift
	end

	def full_name
		"#{first_name} #{last_name}"
	end

	def combined_value
    "#{self.full_name} (#{self.username})"
  end

	private

	def extract_username
		self.username = self.email.split('@').first.downcase
	end

	def downcase_names
		self.first_name = self.first_name.downcase
		self.last_name = self.last_name.downcase
	end

end
