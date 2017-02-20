class PokemonsController < ApplicationController

  def index
    @pokemons = Pokemon.all
  end

  def new
    @pokemon = Pokemon.new
  end

  def create
    @pokemon = Pokemon.new(pokemon_params)
    if @pokemon.save
      redirect_to pokemons_path
    else
      render :new
    end
  end

  def destroy
    pokemon = Pokemon.find(params[:id])
    pokemon.destroy
    redirect_to pokemons_path
  end

  private

  def pokemon_params
    params.require(:pokemon).permit(:name, :pokemon_type)
  end

end
