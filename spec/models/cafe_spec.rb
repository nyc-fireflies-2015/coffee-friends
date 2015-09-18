require 'rails_helper'

RSpec.describe Cafe, type: :model do

  context 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:address) }
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:email) }

    it { should validate_length_of(:username).is_at_most(20) }
    it { should validate_length_of(:email).is_at_most(50) }
    it { should validate_length_of(:name).is_at_most(50) }
    it { should validate_length_of(:address).is_at_most(150) }

    it { should validate_length_of(:password).is_at_least(6).on(:create) }

    it { expect(FactoryGirl.create(:cafe)).to validate_uniqueness_of(:email) }
    it { expect(FactoryGirl.create(:cafe)).to validate_uniqueness_of(:username) }
  end

  context 'associations' do
    it 'should have many menu items' do
      should have_many :menu_items
    end

    it 'should have many coffee gifts' do
      should have_many :coffee_gifts
    end
  end

end


