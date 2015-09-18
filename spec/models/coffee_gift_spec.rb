require 'rails_helper'

describe CoffeeGift do

  context 'associations' do

    it 'should belong to menu items' do
      should belong_to :menu_item
    end

    it 'should belong to receiver' do
      should belong_to :receiver
    end

    it 'should belong to giver' do
      should belong_to :giver
    end 
  end

  context 'delegation' do
    it 'should delegate name to menu items' do
      should delegate_method(:name).to(:menu_item)
    end

    it 'should delegate cafe to menu items' do 
      should delegate_method(:cafe).to(:menu_item)
    end  
  end

end
