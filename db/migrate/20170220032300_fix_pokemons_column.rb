class FixPokemonsColumn < ActiveRecord::Migration[5.0]
  def change
    rename_column :pokemons, :type, :pokemon_type
  end
end
