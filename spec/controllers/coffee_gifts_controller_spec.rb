require 'rails_helper'

describe CoffeeGiftsController do 
	include UserSessionsHelper

	let(:user) { FactoryGirl.create(:user) }
	let(:cafe) { FactoryGirl.create(:cafe) }

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
	end

	context '#show' do 
	end	

end	



  # describe "GET #show" do
  #   it "renders the :show view" do
  #     get :show, id: question
  #     expect(response).to render_template :show
  #   end

  #   it "located the requested @question" do
  #     get :show, id: question
  #     expect(assigns(:question)).to eq(question)
  #   end
  # end



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




