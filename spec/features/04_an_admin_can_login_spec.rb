require 'rails_helper'

RSpec.feature "Admin: " do
  context "not logged in" do
    it "can log in" do
      user = User.create(name: "Adam",
                          username: "AAA",
                          password: "password",
                          role: 1)
      visit login_path
      fill_in "session[username]", with: "AAA"
      fill_in "session[password]", with: "password"
      click_on "Log In"

      expect(current_path).to eq(user_path(user.id))
      expect(page).to have_link("Add a Pokemon")

      within("p") do
        expect(page).to have_content("Administrator")
      end
    end
  end

  # scenario "basic user cannot create pokemon" do
  #
  # end


end
