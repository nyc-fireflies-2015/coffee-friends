class CoffeeGift < ActiveRecord::Base
	belongs_to :menu_item
	belongs_to :receiver, class_name: :User
	belongs_to :giver, class_name: :User

	delegate :name, to: :menu_item
	delegate :cafe, to: :menu_item
  delegate :price, to: :menu_item

  before_save :generate_passphrase

  validates_presence_of :menu_item, :phone

  def assign_phone(params)
    m_id = params[:coffee_gift][:menu_item]
    c_r = params[:coffee_gift][:receiver]
    c_p = params[:coffee_gift][:phone]

    self.menu_item = MenuItem.find_by(id: m_id)
    puts "ERROR" unless user = User.find_by(id: c_r) || User.find_by(phone: c_p)
    self.receiver = user
    self.phone = self.receiver.phone if  self.phone.blank?
  end

  private

  def generate_passphrase
    self.passphrase = Faker::Company.buzzwords.shuffle[0..4].join(" ")
  end

end
