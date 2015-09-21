require 'rails_helper'

RSpec.describe Cafe, type: :feature do

  # let!(:cafe) {FactoryGirl.create(:cafe)}
  # let!(:menu_item) {cafe.menu_items << FactoryGirl.create(:menu_item)}
  # let!(:coffee_gift) {FactoryGirl.build(:coffee_gift)}

  # context "on homepage" do
  #   it "sees a list of cafes" do
  #     visit('/')
  #     expect(page).to have_content(cafe.name)
  #     expect(page).to have_content(cafe.neighborhood)
  #     expect(page).to have_content(cafe.borough)
  #   end

  #   it "can click on cafe images and should be on the cafe show page" do
  #     visit('/')
  #     click_link("", :href => "/cafes/#{cafe.id}")
  #     expect(current_url).to eq("http://www.example.com/cafes/#{cafe.id}")
  #   end
  # end

  # context "show page" do
  #   it "shows cafe details" do
  #     visit("/cafes/#{cafe.id}")
  #     expect(page).to have_content(cafe.name)
  #     expect(page).to have_content(cafe.menu_items[0].name)
  #   end

  #   it "has link to buy coffee for a friend" do
  #     visit("/cafes/#{cafe.id}")
  #     expect(page).to have_link("", :href=> "/cafes/#{cafe.id}/coffee_gifts/new")
  #   end

  # end
end
