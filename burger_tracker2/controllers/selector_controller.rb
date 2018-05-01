get '/selector/?' do
    erb(:"/selector/index")
end

#After the get method, now the post method

post '/selector/reset/?' do
    SqlRunner.reset_table

    Day.generate
    Type.generate

    redirect to('')
end

post '/selector/wipe/?' do
    type_of_burgers_ids = TypeOfBurger.all.map(&:id)
    type_of_burgers_ids.each { |id| TypeOfBurger.delete(id) }

    deal_ids = Deal.all.map(&:id)
    deal_ids.each { |id| Deal.delete(id) }

    burger_ids = Burger.all.map(&:id)
    burger_ids.each { |id| Burger.delete(id) }

  eatery_ids = Eatery.all.map(&:id)
  eatery_ids.each { |id| Eatery.delete(id) }

    redirect to('')
end

post '/selector/seed/?' do
    10.times { Eatery.seed.save }

    50.times do
        new_burger = Burger.seed
        new_burger.save
        rand(2..4).times do
            TypeOfBurger.seed('burger_id', new_burger.id).save
        end
    end

    all_burger_ids = Burger.all.map(&:id).uniq
    all_used_burger_ids = Deal.all.map(&:burger_id)
    range_of_available_burger_ids =
        (all_burger_ids - all_used_burger_ids).uniq.shuffle

    15.times do
        next if range_of_available_burger_ids.empty?
        Deal.seed(
            range_of_available_burger_ids.pop
        ).save
    end
    redirect to('')
end
