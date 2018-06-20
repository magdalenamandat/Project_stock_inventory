require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('../models/item')
require_relative('../models/manufacturer')
also_reload('../models/*')


get '/items/all' do
  @items = Item.all()
  erb(:"items/all")
end

get '/items' do
  @items = Item.all()
  erb(:"items/index")
end

post '/items' do
  @item = Item.new(params)
  @item.save
  # redirect to '/items'
  erb(:"items/create")
end

get '/items/new' do
  @manufacturers = Manufacturer.all()
  @groups = Group.all()
  erb(:"items/new")
end

get '/items/:id' do
  @item = Item.find(params[:id].to_i)
  erb(:"items/show")
end

post '/items/:id' do # update
  Item.new( params ).update
  redirect to '/items'
end

get '/items/:id/edit' do
  @item = Item.find( params[:id] )
  @items = Item.all()
  @manufacturers = Manufacturer.all()
  @groups = Group.all()
  erb( :"items/edit" )
end

post '/items/:id/delete' do # delete
  item = Item.find( params[:id] )
  item.delete()
  redirect to '/items'
end
