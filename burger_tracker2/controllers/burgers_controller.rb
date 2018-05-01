# the gets

get '/burgers/?' do
    @burgers = Burger.all

    @burgers_string = if @burgers.size == 1
                          'is 1 burger'
                      else
                          "are #{@burgers.size} burgers"
    end

    erb(:"/burgers/index")
end

get '/burgers/new/?' do
    @eateries = Eatery.all
    erb(:"/burgers/new")
end

get '/burgers/:burger_id/update/?' do
    @burger = Burger.find_by('id', params[:burger_id]).first
    @eateries = Eatery.all
    erb(:"/burgers/update")
end

# posts

post '/burgers/new/?' do
    Burger.new(params).save
    redirect to "/burgers/#{params['id']}/summary/"
end

post '/burgers/:burger_id/update/?' do
    burger = Burger.find_by('id', params[:burger_id]).first
    burger.name = params[:name]
    burger.eatery_id = params[:eatery_id]
    burger.update
    redirect to "/burgers/#{params[:burger_id]}/summary/"
end

post '/burgers/:burger_id/delete/?' do
    burger = Burger.find_by('id', params[:burger_id]).first
    deal_ids = burger.deals.map(&:id)
  type_of_burger_ids = burger.fillings_for_burgers.map(&:id)

    type_of_burger_ids.each { |id| TypeOfBurger.delete(id) }
    deal_ids.each { |id| Deal.delete(id) }
    Burger.delete(burger.id)

    redirect to('/burgers')
end
