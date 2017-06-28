class PokemonController < ApplicationController
  def index
    res = Typhoeus.get("http://pokeapi.co/api/v2/pokemon/pikachu", followlocation: true)
    body = JSON.parse(res.body)
    render json: {
    respose: [body["id"],
      body["name"],
      body["types"].first["type"]["name"]]
    }
  end
end
