require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/burger_in_deal.rb' )
require_relative( '../models/burger.rb' )
require_relative( '../models/eatery.rb' )
require_relative( '../models/deal.rb' )
require_relative( '../models/eatery_burger.rb' )

get '/burger_in_deals' do
  @burger_in_deals = BurgerInDeal.all
  binding.pry
end
