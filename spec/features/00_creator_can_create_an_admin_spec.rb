require 'rails_helper'

RSpec.feature 'executive page visitation' do
  describe 'when visiting the executive page' do
    scenario 'an executive will see create and delete admin' do

      visit executive_path

      expect(current_path).to eq(executive_path)
      expect(page).to have_content("Executive Page")

    end
  end

  describe 'when exec visits exec page' do
    scenario 'they can enter info and create an admin account' do
      executive = User.create(name: "Adam",
                          username: "AAA",
                          password: "password",
                          role: 3)

      allow_any_instance_of(ApplicationController)
                      .to receive(:current_user)
                      .and_return(executive)

      visit executive_path
      click_on "Create Admin"
      admins = User.where(role: 1).count
      expect(current_path).to eq(new_admin_path)
      expect(page).to have_content("Create New Admin")

      fill_in "user[name]", with: "Brandon"
      fill_in "user[username]", with: "Randall"
      fill_in "user[password]", with: "password"
      fill_in "user[confirmation_password]", with: "password"
      click_on "Create Admin"


      expect(current_path).to eq(user_path(User.last.id))
      expect(page).to have_content("Brandon")
      expect(page).to have_content("Admin Randall")
      # expect(page).to have_content("East")
      expect(User.where(role: 1).count).to eq(admins + 1)

    end
  end
end
