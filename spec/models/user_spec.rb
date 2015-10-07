require 'rails_helper'

RSpec.describe User, type: :model do

  context 'contains valid data' do
	  it { expect(subject).to validate_presence_of(:first_name) }
	  it { expect(subject).to validate_presence_of(:last_name) }
	  it { expect(subject).to validate_presence_of(:email) }
	  it { expect(subject).to validate_presence_of(:password).on(:create) }
	  it { expect(subject).to validate_presence_of(:phone) }
 		it { expect(subject).to validate_length_of(:password).is_at_least(6).on(:create) }
	 	it { expect(subject).to validate_length_of(:email).is_at_most(50).on(:save) }
		it { expect(subject).to have_secure_password }
		it { expect(subject).to allow_value("7667890234").for(:phone) }
		it { expect(subject).to_not allow_value("87659").for(:phone)  }
		it { expect(subject).to_not allow_value("kj78djska1").for(:phone)  }
		it { expect(FactoryGirl.build(:user)).to validate_uniqueness_of(:email) }
	  it { expect(FactoryGirl.build(:user)).to validate_uniqueness_of(:phone) }
		it { expect(FactoryGirl.build(:user)).to validate_presence_of(:username).on(:save) }
	end

	context 'has correct associations' do
		it { expect(subject).to have_many(:given_coffees) }
		it { expect(subject).to have_many(:received_coffees) }
	end

	describe '#received_coffee?, #sent_or_received_coffee?, #find_associated_coffees' do 
		user = FactoryGirl.create(:user)
		menu_item = FactoryGirl.create(:menu_item)
		coffee_gift = user.received_coffees.build(FactoryGirl.attributes_for(:coffee_gift))
		coffee_gift.update_attributes(menu_item: menu_item)
		
		it 'should return true for a user who received coffee' do 
			expect(user.received_coffee?(coffee_gift)).to be_truthy
		end

		it 'should return true for a user who sent coffee' do 
			expect(user.sent_or_received_coffee?(coffee_gift)).to be_truthy
		end

		it 'should include a new coffee gift sent to same phone num' do 
			expect(user.received_coffees).to include(coffee_gift)
		end
	end	

	describe "#full_name" do 
    it 'should return first and last name in a string' do 
      user_attrs = FactoryGirl.attributes_for(:user)
      user = User.create(user_attrs)
      expect(user.full_name).to eq("#{user_attrs[:first_name]} #{user_attrs[:last_name]}")
    end  
  end  

	describe "#combined_value" do 
    it 'should return name and username in a string' do 
      user= FactoryGirl.create(:user)
      expect(user.combined_value).to eq("#{user.full_name} (#{user.username})")
    end  
  end  

end
