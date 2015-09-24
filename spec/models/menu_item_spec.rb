require 'rails_helper'

RSpec.describe MenuItem, type: :model do

  context 'contains valid data' do
    it { expect(subject).to validate_presence_of(:name) }
    it { expect(subject).to validate_presence_of(:price) }
    it { expect(subject).to validate_length_of(:name).is_at_most(30) }
    it { expect(subject).to validate_numericality_of(:price).is_greater_than(0.99) }
    it { expect(subject).to allow_value("5.52").for(:price) }
    it { expect(subject).to_not allow_value("0.57").for(:price) }
    it { expect(subject).to_not allow_value(10.56709089).for(:price) }
    it { expect(subject).to_not allow_value("50000").for(:price) }
  end

  context 'has correct associations' do
    it { expect(subject).to have_many(:coffee_gifts) }
    it { expect(subject).to belong_to(:cafe) }
  end

  describe "#combined_value" do 
    it 'should return name and price in a string' do 
      menu_attrs = FactoryGirl.attributes_for(:menu_item)
      item = MenuItem.create(menu_attrs)
      expect(item.combined_value).to eq("#{menu_attrs[:name]} ($#{menu_attrs[:price]})")
    end  
  end  

end
