class CoffeeGift < ActiveRecord::Base
	belongs_to :menu_item
	belongs_to :receiver, class_name: :User
	belongs_to :giver, class_name: :User

	delegate :name, to: :menu_item
	delegate :cafe, to: :menu_item
  delegate :price, to: :menu_item

  before_save :generate_passphrase

  private

  def generate_passphrase
    self.passphrase = Faker::Company.buzzwords.shuffle[0..4].join(" ")
  end

end
