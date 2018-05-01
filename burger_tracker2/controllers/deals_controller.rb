# getting

get '/deals/?' do
    @deals = Deal.all

    @deals_string = if @deals.size == 1
                        'is 1 deal'
                    else
                        "are #{@deals.size} deals"
                    end

    erb(:"/deals/index")
end

get '/deals/new/?' do
    @eateries = Eatery.all
    @burgers = Burger.all
    @taken_burger_ids = Deal.all.map(&:burger_id)
    erb(:"/deals/new")
end

get '/deals/:deal_id/summary/?' do
    @deal = Deal.find_by('id', params[:deal_id]).first
    erb(:"/deals/summary")
end

get '/deals/:deal_id/update/?' do
    @deal = Deal.find_by('id', params[:deal_id]).first
    @eateries = Eatery.all
    @burgers = Burger.all
    @taken_burger_ids = Deal.all.map(&:burger_id)
    erb(:"/deals/update")
end

# Posts

post '/deals/:deal_id/update/?' do
    deal = Deal.find_by('id', params[:deal_id]).first
    deal.label = params[:label]
    deal.update
    redirect to "/deals/#{params[:deal_id]}/summary"
end

post '/deals/new/?' do
    Deal.new(params).save
    redirect to "/deals/#{params['id'] / summary}"
end

post '/deals/:deal_id/delete/?' do
    Deal.delete(params[:deal_id])
    redirect to('/deals')
end
