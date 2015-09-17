class Cafe < ActiveRecord::Base
	has_secure_password
	has_many :menu_items

	validates_presence_of :name, :address, :username, :email
	validates :username, length: {maximum: 20}
	validates :email, :name, length: {maximum: 50}
	validates :address, length: {maximum: 150}
	validates_email_format_of :email, message: "is not in the correct format"
	validates :password, :presence => true, :length => {minimum: 6}, :on => :create
end
