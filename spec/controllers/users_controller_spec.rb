require 'rails_helper'

describe UsersController do
  include UserSessionsHelper



  describe 'GET #new' do
    it 'assigns a new user' do
      get :new
      expect(assigns(:user)).to be_a_new(User)
    end
  end

  describe 'GET #show' do
    let!(:user) {FactoryGirl.create(:user)}

    it 'renders the show view' do
      get :show
      expect(response).to render_template :show
    end

    it 'shows the profile of the logged in user' do
      log_in_user(user)
      get :show
      expect(assigns(:user)).to eq(user)
    end
  end

  describe 'POST #create' do

    context 'valid info' do
      let!(:user_attribs) { FactoryGirl.attributes_for(:user) }

      it 'creates a new user with valid info' do
        post :create, user: user_attribs
        expect(User.last.username).to eq(user_attribs[:username])
        expect(User.last.email).to eq(user_attribs[:email])
      end

      it 'redirects to home page if signup successful' do
        post :create, user: user_attribs
        expect(response).to redirect_to(root_path)
      end
    end

    context 'invalid info' do
      let!(:invalid_user_attribs) { FactoryGirl.attributes_for(:invalid_user) }

      it 'does not create a new user with invalid info' do
        post :create, user: invalid_user_attribs
        expect(User.last.username).not_to eq(invalid_user_attribs[:username])
        expect(User.last.email).not_to eq(invalid_user_attribs[:email])
      end

      it 'renders register path if signup with invalid info' do
        post :create, user: invalid_user_attribs
        expect(subject).to render_template(:new)
      end

    end



  end


end
