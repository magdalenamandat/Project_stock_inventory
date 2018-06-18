require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('../models/manufacturer')
also_reload('../models/*')


get '/manufacturers' do
  @manufacturers = Manufacturer.all()
  erb(:index)
end
