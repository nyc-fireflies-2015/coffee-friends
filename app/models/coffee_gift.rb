class CoffeeGift < ActiveRecord::Base
	belongs_to :menu_item
	belongs_to :receiver, class_name: :User
	belongs_to :giver, class_name: :User

	delegate :name, to: :menu_item
	delegate :cafe, to: :menu_item
  delegate :price, to: :menu_item

  before_save :generate_passphrase

  validates_presence_of :menu_item, :phone, unless: Proc.new { |gift| gift.charitable? }

  def assign_phone(params)
    self.menu_item = MenuItem.find_by(id: params[:menu_item])
    self.receiver = User.find_by(id: params[:receiver]) || User.find_by(phone: params[:phone])
    self.phone = self.receiver.phone if self.phone.blank? && self.receiver
  end

  private

  def generate_passphrase
    self.passphrase = Faker::Company.buzzwords.shuffle[0..4].join(" ")
  end

end
