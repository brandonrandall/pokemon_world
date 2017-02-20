require 'rails_helper'

RSpec.feature "admin access" do
  context "logged in" do
    it "Can delete a new pokemon" do

      admin = User.create(name: "Adam",
                          username: "AAA",
                          password: "password",
                          role: 1)

      pokemon = Pokemon.create(name: "Whatthefuh",
                              pokemon_type: "blob")

      allow_any_instance_of(ApplicationController)
                      .to receive(:current_user)
                      .and_return(admin)

      visit pokemons_path(admin.id)
      expect(page).to have_content("Whatthefuh")
      expect(page).to have_content("Type: blob")
      click_on "Delete Pokemon"
      expect(current_path).to eq(pokemons_path)
      expect(page).to_not have_content("Whatthefuh")
      expect(page).to_not have_content("Type: blob")

    end
  end
end
