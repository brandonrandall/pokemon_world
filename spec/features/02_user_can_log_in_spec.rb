require 'rails_helper'

RSpec.feature "log in" do
  describe "with valid credentials" do
    scenario "member can log into their account" do
      user = User.create(name: "Ashley", username: "A1", password: "password")

      visit root_path
      click_on "Log In"

      expect(current_path).to eq(login_path)
      # expect(page).to have_content("Log In")
      # save_and_open_page
      fill_in "session[username]", with: user.username
      fill_in "session[password]", with: user.password
      fill_in "session[confirmation_password]", with: user.password
      click_on "Log In"

      expect(current_path).to eq(user_path(user.id))

      # within("h1.greeting") do
      #   expect(page).to have_content("Welcome RegUser!")
      # end
    end
  end
end
