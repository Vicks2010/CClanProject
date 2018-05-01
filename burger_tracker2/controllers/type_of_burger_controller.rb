# gets

get '/type_of_burgers/new/?' do
    @types = Type.all
    @burgers = Burger.all
    erb(:"/type_of_burgers/new")
end

#posts

post '/type_of_burgers/new/?' do
    TypeOfBurger.new(params).save
    redirect to "/burgers/#{params['burger_id']}/summary"
end
