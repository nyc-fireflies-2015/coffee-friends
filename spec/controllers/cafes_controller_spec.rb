require 'rails_helper'

describe CafesController do

  let!(:cafe) {FactoryGirl.create(:cafe)}

  describe 'GET #index' do

    context 'cafe index page' do

      before :each do
        get :index
      end

      it 'assigns all cafes to @cafes' do
      expect(assigns(:cafes)).to match(Cafe.all)
      end

      it 'renders the correct page' do
        expect(response).to render_template :index
      end

    end

  end

  describe 'GET #show' do

    context 'shows a particular cafe' do

      before :each do
        get :show, id: cafe.id
      end

      it 'assigns the correct cafe to @cafe' do
        expect(assigns(:cafe)).to eq(cafe)
      end

      it 'renders the correct page' do
        expect(response).to render_template('show')
      end

    end

  end

end
