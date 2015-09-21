class CoffeeGift < ActiveRecord::Base
	belongs_to :menu_item
	belongs_to :receiver, class_name: :User
	belongs_to :giver, class_name: :User

	delegate :name, to: :menu_item
	delegate :cafe, to: :menu_item
  delegate :price, to: :menu_item

  before_create :generate_redemption_code

  validates_presence_of :menu_item, :phone

  def assign_phone(params)
    m = params[:coffee_gift][:menu_item]
    r = params[:coffee_gift][:receiver]
    p = params[:coffee_gift][:phone]

    self.menu_item = MenuItem.find_by(id: m)
    user = User.find_by(id: r) || User.find_by(phone: p)
    if user
      self.receiver = user
      self.phone = user.phone if self.phone.blank?
    else
      puts "ERROR"
    end
  end

  private

  def generate_redemption_code
    self.redemption_code = rand(36**8).to_s(36)
  end



end
