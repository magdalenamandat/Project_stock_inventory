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

get '/items/:id' do
  @item = Item.find(params[:id].to_i)
  erb(:"items/show")
end

post '/items/:id/delete' do # delete
  item = Item.find( params[:id] )
  item.delete()
  redirect to '/items'
end
