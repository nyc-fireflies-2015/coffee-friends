class MenuItem < ActiveRecord::Base
	belong_to :cafe
	has_many :coffee_gifts

	validates_presence_of :name, :price
	validates :name, length: {maximum: 30}
	## price validation
end
