require 'sinatra'
require 'sinatra/reloader'
require 'active_record'

require_relative 'db/connection'
require_relative 'models/pokemon'

get '/pokemons' do
  @pokemons = Pokemon.all
  erb :'pokemons/index'
end

get '/pokemons/new' do
  erb :'pokemons/new'
end

get '/pokemons/:id' do
  @pokemon = Pokemon.find(params[:id])
  erb :'pokemons/show'
end

post '/pokemons' do
  pokemon = Pokemon.create(params[:pokemon])
  redirect to("/pokemons/#{pokemon.id}")
end

delete '/pokemons/:id' do
  Pokemon.destroy(params[:id])
  redirect to('/pokemons')
end
