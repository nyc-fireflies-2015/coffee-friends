require 'rails_helper'

RSpec.describe MenuItemsController, type: :controller do
  include CafeSessionsHelper

  def new_menu_item
    @cafe = FactoryGirl.create(:cafe)
    log_in_cafe(@cafe)
    @menu_item = @cafe.menu_items.new
  end

  def menu_item_attrs
    FactoryGirl.attributes_for(:menu_item)
  end

  def invalid_menu_item_attrs
    FactoryGirl.attributes_for(:invalid_menu_item)
  end

  def create_menu_item
    new_menu_item
    @menu_item.update_attributes(menu_item_attrs)
  end

  describe 'POST #create' do
    it 'adds a menu item to a cafes menu' do
      new_menu_item
      expect{post :create, cafe_id: @cafe.id, menu_item: menu_item_attrs }.to change{@cafe.menu_items.count}.by(1)
    end
    it 'does not add an invalid menu item' do
      new_menu_item
      expect{post :create, cafe_id: @cafe.id, menu_item: invalid_menu_item_attrs }.to change{@cafe.menu_items.count}.by(0)
    end
    it 'redirects to cafe#profile after attempting to add' do
      new_menu_item
      post :create, cafe_id: @cafe.id, menu_item: menu_item_attrs
      expect(response).to redirect_to(cafes_profile_path)
    end

    it 'does not allow creation when logged out' do
      @cafe = FactoryGirl.create(:cafe)
      @menu_item = @cafe.menu_items.new
      expect {
        post :create, cafe_id: @cafe, menu_item: menu_item_attrs
      }.to change(Cafe, :count).by(0)
    end
  end

  describe 'PUT #update' do
    it 'updates the attributes of a menu item' do
      create_menu_item
      new_attrs = menu_item_attrs
      put :update, cafe_id: @cafe.id, id: @menu_item.id, menu_item: new_attrs
      @menu_item.reload
      attrs = {name: @menu_item.name, price: @menu_item.price}
      expect(attrs).to eq(new_attrs)
    end
    it 'does not update menu item with invalid params' do
      create_menu_item
      old_attrs = @menu_item.attributes
      new_attrs = invalid_menu_item_attrs
      put :update, cafe_id: @cafe.id, id: @menu_item.id, menu_item: new_attrs
      expect(@menu_item.attributes).to eq(old_attrs)
    end
    it 'redirects to cafe#profile after attempting to update' do
      create_menu_item
      put :update, cafe_id: @cafe.id, id: @menu_item.id, menu_item: menu_item_attrs
      expect(response).to redirect_to(cafes_profile_path)
    end
    it 'does not allow edits when logged out' do
      @cafe = FactoryGirl.create(:cafe)
      @menu_item = @cafe.menu_items.create(menu_item_attrs)
      old_attrs = @menu_item.attributes
      new_attrs = menu_item_attrs
      put :update, cafe_id: @cafe.id, id: @menu_item.id, menu_item: new_attrs
      @menu_item.reload
      expect(@menu_item.attributes).to eq(old_attrs)
    end
    it 'does not allow edits when unauthorized' do
      @cafe1 = FactoryGirl.create(:cafe)
      @cafe2 = FactoryGirl.create(:cafe)
      log_in_cafe(@cafe1)
      @menu_item = @cafe2.menu_items.create(menu_item_attrs)
      old_attrs = @menu_item.attributes
      new_attrs = menu_item_attrs
      put :update, cafe_id: @cafe2.id , id: @menu_item.id, menu_item: new_attrs
      @menu_item.reload
      expect(@menu_item.attributes).to eq(old_attrs)
    end
  end

  describe 'DELETE #destroy' do
    it 'reduces menu item count by 1' do
      create_menu_item
      expect{delete :destroy, cafe_id: @cafe.id, id: @menu_item.id}.to change{@cafe.menu_items.count}.by(-1)
    end
    it 'redirects to cafe#profile after destruction' do
      create_menu_item
      delete :destroy, cafe_id: @cafe.id, id: @menu_item.id
      expect(response).to redirect_to(cafes_profile_path)
    end
    it 'does not allow destruction when logged out' do
      @cafe = FactoryGirl.create(:cafe)
      @menu_item = @cafe.menu_items.new
      @menu_item.update_attributes(menu_item_attrs)
      expect{delete :destroy, cafe_id: @cafe.id, id: @menu_item.id}.to change{@cafe.menu_items.count}.by(0)
    end
    it 'does not allow destruction when unauthorized' do
      @cafe1 = FactoryGirl.create(:cafe)
      @cafe2 = FactoryGirl.create(:cafe)
      log_in_cafe(@cafe1)
      @menu_item = @cafe2.menu_items.new
      @menu_item.update_attributes(menu_item_attrs)
      expect{delete :destroy, cafe_id: @cafe2.id, id: @menu_item.id}.to change{@cafe1.menu_items.count}.by(0)
    end
  end
end

