class CoffeeGift < ActiveRecord::Base
	belongs_to :menu_item
	belongs_to :receiver, class_name: :User
	belongs_to :giver, class_name: :User

	delegate :name, to: :menu_item
	delegate :cafe, to: :menu_item
  delegate :price, to: :menu_item

  before_save :generate_passphrase

  def add_menu_and_receiver(params)
    self.receiver = User.find_by(username: params[:coffee_gift][:receiver]) || User.find_by(phone: params[:coffee_gift][:phone])
    self.menu_item = MenuItem.find_by(id: params[:coffee_gift][:menu_item])
    self.phone = self.receiver.phone if self.phone.empty?
    # self.assign_attributes(receiver: receiver, menu_item: menu_item, phone: phone)
    binding.pry
  end  

  # def add_phone(params)
  #   self.assign_attributes(phone:self.receiver.phone) if self.phone.nil?
  # end  

  private

  def generate_passphrase
    self.passphrase = Faker::Company.buzzwords.shuffle[0..4].join(" ")
  end

end
