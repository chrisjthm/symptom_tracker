require 'spec_helper'

describe "Static pages" do

  describe "Home page" do

    it "should have the content 'Symptom Tracker'" do
      visit '/static_pages/home'
      expect(page).to have_content('Symptom Tracker')
    end

    it "should have the title 'Home'" do
      visit '/static_pages/home'
      expect(page).to have_title("Symptom Tracker | Home")
    end
  end

  describe "Help page" do

    it "should have the content 'Help'" do
      visit '/static_pages/help'
      expect(page).to have_content('Help')
    end

    it "should have the title 'Help'" do
      visit '/static_pages/help'
      expect(page).to have_title("Symptom Tracker | Help")
    end
  end
end