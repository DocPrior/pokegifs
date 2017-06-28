class PokemonController < ApplicationController
  def show
    res = Typhoeus.get("http://pokeapi.co/api/v2/pokemon/#{params[:id]}", followlocation: true)
    poke_body = JSON.parse(res.body)
    response = Typhoeus.get("https://api.giphy.com/v1/gifs/search?api_key=#{ENV["GIPHY_KEY"]}&q=#{poke_body["name"]}", followlocation: true)
    giphy = JSON.parse(response.body)
    render json: {
      id: poke_body["id"],
    name:  poke_body["name"],
    type:  poke_body["types"].first["type"]["name"],
    giphy: giphy["data"].first["embed_url"]
    }


  end
end
