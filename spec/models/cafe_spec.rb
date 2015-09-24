require 'rails_helper'

RSpec.describe Cafe, type: :model do

  let(:cafe) { FactoryGirl.create(:cafe) }
  let(:menu_item) {FactoryGirl.create(:menu_item)}

  context 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:address) }
    it { should validate_presence_of(:email) }
    it { should validate_length_of(:email).is_at_most(50) }
    it { should validate_length_of(:name).is_at_most(50) }
    it { should validate_length_of(:address).is_at_most(150) }
    it { should validate_length_of(:password).is_at_least(6).on(:create) }
    it { expect(FactoryGirl.build(:cafe)).to validate_uniqueness_of(:email) }
  end

  context 'associations' do
    it 'should have many menu items' do
      should have_many :menu_items
    end

    it 'should have many coffee gifts' do
      should have_many :coffee_gifts
    end
  end

  describe '#owns_item?' do 
    it 'should return true for a menu belonging to a particular cafe' do 
      item = cafe.menu_items.create(FactoryGirl.attributes_for(:menu_item))
      expect(cafe.owns_item?(item)).to be_truthy
    end 
  end  

  describe '#owner?' do 
    it 'should return true if current cafe is logged in' do 
      expect(cafe.owner?(cafe)).to be_truthy
    end  
  end 


  describe '#redeemed_coffee_gifts' do 
    it 'should return a list of all redeemed coffee gifts' do 
      cafe = FactoryGirl.create(:cafe)
      menu_item = cafe.menu_items.create(FactoryGirl.attributes_for(:menu_item))
      redeemed_gifts = (1..5).to_a.map {menu_item.coffee_gifts.create(menu_item: menu_item, charitable: true, redeemed: true)}
      expect(cafe.redeemed_coffee_gifts.to_a).to eq(redeemed_gifts)
    end
  end

  describe '#to_param' do 
    it 'should generate the correct slug' do 
      cafe = FactoryGirl.create(:cafe)
      cafe.update_attributes(name: "Example Cafe")
      expect(cafe.slug).to eq("example-cafe")
    end  
  end

end


