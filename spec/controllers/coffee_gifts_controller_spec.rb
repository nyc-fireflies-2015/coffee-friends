 require 'rails_helper'

describe CoffeeGiftsController do
	include UserSessionsHelper

	let(:user) { FactoryGirl.create(:user) }
	let(:cafe) { FactoryGirl.create(:cafe) }
	let(:coffee_gift) { FactoryGirl.create(:coffee_gift) }
	let(:menu_item) { FactoryGirl.create(:menu_item) }
	let(:twilio_receiver) { FactoryGirl.create(:twilio_receiver) }
	let(:cc_info) {{"num" => "5105105105105100", "exp_date" => "05/12"}}

	def prepare_coffee_gift_show
		@user = FactoryGirl.create(:user)
		log_in_user(user)
		attrs = FactoryGirl.attributes_for(:coffee_gift).merge(receiver: twilio_receiver, menu_item: menu_item)
		@coffee_gift = user.received_coffees.create(attrs)
	end

	def coffee_gift_attrs
		FactoryGirl.attributes_for(:coffee_gift).merge(receiver: twilio_receiver.username, menu_item: menu_item)
	end

	context '#new' do
		it 'renders the new coffee gift form' do
			log_in_user(user)
			get :new, cafe_id: cafe
			expect(response).to render_template(:new)
		end

		it 'redirects to root if not logged in' do
			get :new, cafe_id: cafe
			expect(response).to redirect_to(root_path)
		end
	end

	context '#create' do
		it 'redirects to root if not logged in' do
			coffee_gift_attributes = FactoryGirl.attributes_for(:coffee_gift)
			post :create, cafe_id: cafe, coffee_gift: coffee_gift_attributes
			expect(response).to redirect_to(root_path)
		end

		xit 'redirects to new coffee gift if params are invalid' do

		end

		it 'creates a new coffee gift' do
			log_in_user(user)
			expect{post :create, cafe_id: cafe, coffee_gift: coffee_gift_attrs, cc: cc_info }.to change{CoffeeGift.all.count}.by(1)
		end

		it 'redirects to a confirmation page' do
			log_in_user(user)
			post :create, cafe_id: cafe, coffee_gift: coffee_gift_attrs, cc: cc_info
			expect(response).to redirect_to(confirmation_path(CoffeeGift.last))
		end
	end

	context '#show' do
		it 'redirects to root if not logged in' do
			get :show, id: coffee_gift
			expect(response).to redirect_to(root_path)
		end

		it 'redirects to root if not authorized to view coffee gift' do
			log_in_user(user)
			get :show, id: coffee_gift
			expect(response).to redirect_to(root_path)
		end

		it 'renders the show coffee gift view if coffee belongs to current user' do
			prepare_coffee_gift_show
			get :show, id: @coffee_gift
			expect(response).to render_template(:show)
		end

		it 'locates the requested coffee gift' do
			prepare_coffee_gift_show
			get :show, id: @coffee_gift
			expect(assigns(:coffee_gift)).to eq(@coffee_gift)
			expect(assigns(:cafe)).to eq(@coffee_gift.cafe)
		end
	end

	context '#update' do
		xit 'creates new text sender' do
		end
		xit 'redirects to cafe profile path in success case' do
		end
		xit 'redirects to cafe profile in error case' do
		end
	end

	context '#confirm' do
		xit 'assigns the coffee gifts cafe to @cafe' do
		end
	end

	context 'transactions' do
		xit 'assigns @processor_response_code in error case' do
		end
		xit 'assigns @processor_response_text in error case' do
		end
		xit 'assigns errors for invalid params' do
		end
	end

end





