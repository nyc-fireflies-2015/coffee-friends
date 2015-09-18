class User < ActiveRecord::Base
	has_secure_password

	has_many :given_coffees, class_name: :CoffeeGift, foreign_key: :giver_id
	has_many :received_coffees, class_name: :CoffeeGift, foreign_key: :receiver_id

	validates_presence_of :username, :email, :phone
	validates_uniqueness_of :username, :email, :phone
	validates :username, length: {maximum: 20}
	validates :email, length: {maximum: 50}
	validates_email_format_of :email, message: "is not in the correct format"
	validates :password, :presence => true, :length => {minimum: 6}, :on => :create
	##write validation for phone number

	def reward
		##what will this return?
	end	

end
