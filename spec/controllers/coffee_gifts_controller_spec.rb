 require 'rails_helper'

describe CoffeeGiftsController do
	include UserSessionsHelper

	let(:user) { FactoryGirl.create(:user) }
	let(:cafe) { FactoryGirl.create(:cafe) }
	let(:coffee_gift) { FactoryGirl.build(:coffee_gift) }
	let(:menu_item) { FactoryGirl.create(:menu_item) }
	let(:twilio_receiver) { FactoryGirl.create(:twilio_receiver) }
	let(:cc_info) {{"num" => "5105105105105100", "exp_date" => "05/12"}}

	def prepare_coffee_gift_show
		@user = FactoryGirl.create(:user)
		log_in_user(@user)
		attrs = FactoryGirl.attributes_for(:coffee_gift).merge(receiver: twilio_receiver, menu_item: menu_item, phone: twilio_receiver.phone)
		@coffee_gift = @user.received_coffees.create(attrs)
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
			log_in_user(user)
			post :create, cafe_id: cafe, coffee_gift: {menu_item: "bad data"}
			expect(response).to redirect_to(new_cafe_coffee_gift_path(cafe))
		end

		it 'creates a new coffee gift' do
			log_in_user(user)
			attrs = FactoryGirl.attributes_for(:coffee_gift).merge(receiver: twilio_receiver.id, menu_item: menu_item)
			expect{post :create, cafe_id: cafe, coffee_gift: attrs, cc: cc_info }.to change{CoffeeGift.all.count}.by(1)
		end

		it 'redirects to a confirmation page' do
			log_in_user(user)
			attrs = FactoryGirl.attributes_for(:coffee_gift).merge(receiver: twilio_receiver.id, menu_item: menu_item)
			post :create, cafe_id: cafe, coffee_gift: attrs, cc: cc_info
			binding.pry
			expect(response).to redirect_to(confirmation_path(CoffeeGift.last))
		end
	end

	context '#show' do
		it 'redirects to root if not logged in' do
			attrs = FactoryGirl.attributes_for(:coffee_gift).merge(receiver: twilio_receiver, menu_item: menu_item, phone: twilio_receiver.phone)
			coffee_gift = user.received_coffees.create(attrs)
			get :show, id: coffee_gift
			expect(response).to redirect_to(root_path)
		end

		it 'redirects to root if not authorized to view coffee gift' do
			log_in_user(user)
			user2 = FactoryGirl.create(:user)
			attrs = FactoryGirl.attributes_for(:coffee_gift).merge(receiver: twilio_receiver, menu_item: menu_item, phone: twilio_receiver.phone)
			coffee_gift = user2.received_coffees.create(attrs)
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
		it 'assigns the coffee gifts cafe to @cafe' do
			log_in_user(user)
			@menu_item = cafe.menu_items.create(FactoryGirl.attributes_for(:menu_item))
			@coffee_gift = CoffeeGift.create(phone:"1234567890", menu_item: @menu_item)
			get :confirm, id: @coffee_gift
			expect(assigns(:cafe)).to be_a(Cafe)
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





