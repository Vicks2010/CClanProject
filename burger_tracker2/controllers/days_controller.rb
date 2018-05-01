# gets

get '/days/?' do
    @days = Day.all

    @days_string = if @days.size == 1
                       'is 1 day'
                   else
                       "are #{@days.size} days"
    end

    erb(:"/days/index")
end
