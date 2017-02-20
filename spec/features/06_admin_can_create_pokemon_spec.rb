require 'rails_helper'

RSpec.feature "admin access" do
  context "logged in" do
    it "Can create a new pokemon" do

      admin = User.create(name: "Adam",
                          username: "AAA",
                          password: "password",
                          role: 1)

      allow_any_instance_of(ApplicationController)
                      .to receive(:current_user)
                      .and_return(admin)

      visit user_path(admin.id)

      click_on "Add a Pokemon"
      fill_in "pokemon[name]", with: "Gengar"
      fill_in "pokemon[pokemon_type]", with: "Ghost"
      click_on "Create Pokemon"

      expect(current_path).to eq(pokemons_path)
      # save_and_open_page
      # within(".pokedex h2") do
        expect(page).to have_content("Gengar")
      # end
      # within(".pokedex p") do
        expect(page).to have_content("Type: Ghost")
      # end
    end
  end
end
