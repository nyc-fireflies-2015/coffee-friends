require 'rails_helper'
require 'phony_rails'

RSpec.describe User, type: :model do

	context 'phone number normalizes properly' do 
		it 'formats a phone number separated by dashes' do 
			expect(PhonyRails.normalize_number('206-544-6643', country_code: 'US')).to eq('+12065446643')
		end	

		it 'formats a phone number separated by dots and slashes' do 
			expect(PhonyRails.normalize_number('206.544/6643', country_code: 'US')).to eq('+12065446643')
		end	

		it 'formats a phone number with no special characters' do 
			expect(PhonyRails.normalize_number('2065446643', country_code: 'US')).to eq('+12065446643')
		end	
	end

  context 'contains valid data' do
	  it { expect(subject).to validate_presence_of(:username) }
	  it { expect(subject).to validate_presence_of(:email) }
	  it { expect(subject).to validate_presence_of(:password).on(:create) }
	  it { expect(subject).to validate_presence_of(:phone) }
 		it { expect(subject).to validate_length_of(:password).is_at_least(6).on(:create) }
	  it { expect(subject).to validate_length_of(:username).is_at_most(50) }
	 	it { expect(subject).to validate_length_of(:email).is_at_most(50) }
		it { expect(subject).to have_secure_password }
		# it { expect(FactoryGirl.create(:valid_phone_user)).to validate_uniqueness_of(:phone) }
	end

	context 'uniqueness validations pass' do 

		user = FactoryGirl.create(:user) 
		user.update_attributes(phone: PhonyRails.normalize_number(user.phone, country_code: 'US'))
		user.reload

		it { expect(user).to validate_uniqueness_of(:email) }
		it { expect(user).to validate_uniqueness_of(:username) }
	end	

	context 'has correct associations' do
		it { expect(subject).to have_many(:given_coffees) }
		it { expect(subject).to have_many(:received_coffees) }
	end

end	
