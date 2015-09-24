class MenuItem < ActiveRecord::Base
	belongs_to :cafe
	has_many :coffee_gifts

	validates_presence_of :name, :price
	validates :name, length: {maximum: 30}
  validates :price, :format => { :with => /\A\d{1,4}(\.\d{0,2})?\z/ }, :numericality => {:greater_than => 0.99}

  def combined_value
    "#{self.name} ($#{self.price})"
  end

end
