# start with get

get '/eateries/?' do
    redirect to('/eateries/burgers')
end

get '/eateries/burgers/?' do
    @eateries = Eatery.all
    @eateries_string = if @eateries.size == 1
                                  'is 1 eatery'
                              else
                                  "are #{@eateries.size} eateries"
    end
    erb(:"/eateries/burgers")
end

get '/eateries/deals/?' do
    @eateries = BurgerEatery.all
    @eateries_string = if @eateries.size == 1
                                  'is 1 eatery'
                              else
                                  "are #{@eateries.size} eateries"
    end
    erb(:"/eateries/deals")
    end

    get '/eateries/new/?' do
        erb(:"/eateries/new")
    end

    get '/eateries/:eatery_id/update/?' do
        @eatery = Eatery.find_by('id', params[:eatery_id]).first
        erb(:"/eateries/update")
    end

    get '/eateries/:eatery_id/summary/?' do
        @eatery = Eatery.find_by('id', params[:eatery_id]).first
        erb(:"/eateries/summary")
    end

# posts for eateries

post '/eateries/:eatery_id/update/?' do
    eatery = Eatery.find_by('id', params[:eatery_id]).first
    eatery.name = params[:name]
    eatery.update
    redirect to "/eateries/#{params[:eatery_id]}/summary/"
end

post '/eateries/new/?' do
    Eatery.new(params).save
    redirect to "/eateries/#{params['id']}/summary/"
end

post '/eateries/:eatery_id/delete/?' do
    eatery = Eatery.find_by('id', params[:eatery_id]).first
    burger_ids = eatery.burgers.map(&:id)
    deal_ids = eatery.deals.map(&:id)
    type_of_burger_ids = burger_ids.map do |burger_id|
        TypeOfBurger.find_by('burger_id', burger_id).map(&:id)
    end.flatten.uniq

    type_of_burger_ids.each { |id| TypeOfBurger.delete(id) }
    deal_ids.each { |id| Deal.delete(id) }
    burger_ids.each { |id| Burger.delete(id) }
    Eatery.delete(params[:eatery_id])

    redirect to('/eateries')
end
