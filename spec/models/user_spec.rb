require 'rails_helper'

RSpec.describe User, type: :model do
  context 'contains valid data' do

  	# let(:user) { FactoryGirl.create(:user) }

	  it { expect(subject).to validate_presence_of(:username) }
	  it { expect(subject).to validate_presence_of(:email) }
	  it { expect(subject).to validate_presence_of(:phone) }
	  it { expect(subject).to validate_presence_of(:password).on(:create) }
 		it { expect(subject).to validate_length_of(:password).is_at_least(6).on(:create) }
	  it { expect(subject).to validate_length_of(:username).is_at_most(20) }
	 	it { expect(subject).to validate_length_of(:email).is_at_most(50) }
		it { expect(subject).to have_secure_password }
		it { expect(FactoryGirl.create(:user)).to validate_uniqueness_of(:email) }
		it { expect(FactoryGirl.create(:user)).to validate_uniqueness_of(:username) }
		it { expect(FactoryGirl.create(:user)).to validate_uniqueness_of(:phone) }
	end

	context 'has correct associations' do
		it { expect(subject).to have_many(:given_coffees) }
		it { expect(subject).to have_many(:received_coffees) }
	end

end	
