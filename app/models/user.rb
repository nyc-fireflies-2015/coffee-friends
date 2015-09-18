class User < ActiveRecord::Base
	has_secure_password

	has_many :given_coffees, class_name: :CoffeeGift, foreign_key: :giver_id
	has_many :received_coffees, class_name: :CoffeeGift, foreign_key: :receiver_id

	before_save :normalize_phone

	validates_presence_of :username, :email, :phone
	validates_uniqueness_of :username, :email, :phone
	validates :username, length: {maximum: 50}
	validates :email, :username, length: {maximum: 50}
	validates_email_format_of :email, message: "is not in the correct format"
	validates_format_of :phone, with: /\d{10}/, message: "is not in the correct format"
	validates :password, :presence => true, :length => {minimum: 6}, :on => :create

	def reward
		##what will this return?
	end

	private

	def normalize_phone
		self.phone = "+1" + phone.to_s
	end

	def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end


end
