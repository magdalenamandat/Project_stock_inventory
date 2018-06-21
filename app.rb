require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/manufacturers_controller')
require_relative('controllers/items_controller')
require_relative('./models/shop')

get '/' do
  @items = Item.all()
  @shop = Shop.new(@items)
  erb( :"index" )
end
