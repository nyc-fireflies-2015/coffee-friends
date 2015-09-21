require 'rails_helper'

describe CafesController do

  let!(:cafe) {FactoryGirl.create(:cafe)}

  describe 'GET #index' do
    context 'cafe index page' do

      before :each do
        get :index
      end

      it 'assigns all cafes to @cafes' do
        expect(assigns(:cafes)).to eq(Cafe.all)
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

      it 'assigns a new menu item to @menu_item' do
        expect(assigns(:menu_item)).to be_a(MenuItem)
      end

      it 'assigns a cafes menu items to @menu_items' do
        expect(assigns(:menu_items)).to eq(cafe.menu_items)
      end

      it 'renders the correct page' do
        expect(response).to render_template('show')
      end
    end
  end

  describe 'GET #borough' do
    pending
  end

  describe 'GET #neighborhood' do
    pending
  end
end
