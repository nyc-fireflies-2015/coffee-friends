require 'rails_helper'

describe CoffeeGiftsController do 
	include UserSessionsHelper

	let(:user) { FactoryGirl.create(:user) }
	let(:cafe) { FactoryGirl.create(:cafe) }
	let(:coffee_gift) { FactoryGirl.create(:coffee_gift) }
	let(:menu_item) { FactoryGirl.create(:menu_item) }

	def coffee_gift_attrs
		FactoryGirl.attributes_for(:coffee_gift).merge(receiver: user, menu_item: menu_item)
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

		let(:coffee_gift_attrs) { FactoryGirl.attributes_for(:coffee_gift)}

		it 'redirects to root if not logged in' do 
			post :create, cafe_id: cafe, coffee_gift: coffee_gift_attrs
			expect(response).to redirect_to(root_path)
		end
		
		it 'creates a new coffee gift' do 
		end

		it 'notifies the receiver of the gift' do 
		end

		it 'redirects to a confirmation page' do 
		end

		it 'does not create a coffee gift with invalid attributes' do 
		end	
	end

	context '#show' do 

		it 'redirects to root if not logged in' do 
			get :show, id: coffee_gift
			expect(response).to redirect_to(root_path)
		end
		
		it 'redirects to root if not authorized to view coffee gift' do 
			current_user = FactoryGirl.create(:user)
			log_in_user(current_user)
			coffee_gift.update_attributes(coffee_gift_attrs)
			# binding.pry
			get :show, id: coffee_gift
			expect(response).to redirect_to(root_path)
		end	

		# it 'renders the show coffee gift view' do 
		# 	log_in_user(user)
		# 	# coffee_gift = user.received_coffees.create(FactoryGirl.attributes_for(:coffee_gift))
		# 	get :show, id: coffee_gift
		# 	expect(response).to render_template(:show)
		# end
		
		# it 'locates the requested coffee gift' do 
		# 	get :show, id: coffee_gift
		# 	menu_item.update_attributes(cafe: cafe)
		# 	coffee_gift.update_attributes(menu_item: menu_item)
		# 	expect(assigns(:coffee_gift)).to eq(coffee_gift)
		# 	expect(assigns(:cafe)).to eq(coffee_gift.cafe)
		# end	
	end	

end	

  # describe "POST #create" do
  #   context "valid attributes" do
  #     it "redirects to root if not logged in" do
  #       post :create, question: FactoryGirl.attributes_for(:question)
  #       expect(response).to redirect_to root_path
  #     end

  #     it "creates a new question" do
  #       log_in(user)
  #       question_attributes = FactoryGirl.attributes_for(:question)
  #       post :create, question: question_attributes
  #       expect(Question.last).to have_attributes question_attributes
  #     end

  #     it "redirects to new question show view" do
  #       log_in(user)
  #       post :create, question: FactoryGirl.attributes_for(:question)
  #       expect(response).to redirect_to(question_path(Question.last))
  #     end
  #   end

  #   context "invalid attributes" do
  #     it "doesn't create a post with invalid attributes" do
  #       log_in(FactoryGirl.create(:user))
  #       question_attributes = { title: "Title", content: nil }
  #       post :create, question: question_attributes
  #       expect(response).to redirect_to new_question_path
  #     end
  #   end
  # end




