require 'rails_helper'

RSpec.feature 'home page visitation' do
  describe 'when visiting the home page' do
    scenario 'a visitor will see login, signup or admin login' do

      visit root_path
      expect(current_path).to eq(root_path)
      expect(page).to have_content("Pokemon World Home Page")
    end
  end

  describe 'when visitor signs in' do
    scenario 'they can enter info and create a user account' do

      visit root_path
      click_on "Sign Up"

      users = User.count
      expect(current_path).to eq(new_user_path)
      expect(page).to have_content("Create New Account")

      fill_in "user[name]", with: "Brandon"
      fill_in "user[username]", with: "B1"
      fill_in "user[password]", with: "password"
      fill_in "user[confirmation_password]", with: "password"
      click_on "Create Account"

      expect(current_path).to eq(user_path(User.last.id))
      expect(page).to have_content("Brandon")
      expect(page).to have_content("B1")
      # expect(page).to have_content("East")
      expect(User.count).to eq(users + 1)

    end
  end
end
