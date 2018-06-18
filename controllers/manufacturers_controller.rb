require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('../models/manufacturer')
also_reload('../models/*')


get '/manufacturers' do
  @manufacturers = Manufacturer.all()
  erb(:"manufacturers/index")
end

get '/manufacturers/:id' do
  @manufacturer = Manufacturer.find(params[:id].to_i)
  erb(:"manufacturers/show")
end

post '/manufacturers/:id/delete' do # delete
  manufacturer = Manufacturer.find( params[:id] )
  manufacturer.delete()
  redirect to '/manufacturers'
end
