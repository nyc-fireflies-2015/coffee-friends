require 'rails_helper'

RSpec.describe User, type: :feature do

  let!(:cafe) {FactoryGirl.create(:cafe)}

  context "on homepage" do
    it "sees a list of cafes" do
      visit('/')
      expect(page).to have_content(cafe.name)
      expect(page).to have_content(cafe.neighborhood)
      expect(page).to have_content(cafe.borough)
    end

    xit "can click on cafe images and should be on the cafe show page" do
      # visit('/')
      # click_link #link#
      # expect(current_url).to eq(#url#)
    end
  end

  context "cafe show page" do
    xit "sees cafe details" do
      # visit #path#
      # expect(page).to have_content(#content#)
    end
  end
end
