require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('../models/item')
also_reload('../models/*')


get '/items' do
  @items = Item.all()
  erb(:"items/index")
end

get '/items/new' do
  erb(:"items/new")
end
