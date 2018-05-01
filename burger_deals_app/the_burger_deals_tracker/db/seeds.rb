require("pry-byebug")

require_relative( "../models/burger.rb" )
require_relative( "../models/eatery.rb" )
require_relative( "../models/deal.rb" )
require_relative( "../models/deal_burger.rb" )
require_relative( "../models/eatery_burger.rb" )
require_relative( "../models/eatery_deal.rb" )


# Burger.delete()
# Eatery.delete_all()
# Deal.delete_all()
# DealBurger.delete_all()
# EateryBurger.delete_all()
# EateryDeal.delete_all()

burger1 = Burger.new({
  "name" => "Hamburgers",

  })

  burger1.save()

  burger2 = Burger.new({
    "name" => "Beef Burgers",

    })

    burger2.save()

    burger3 = Burger.new({
      "name" => "Chicken Burgers",

      })

      burger3.save()

      burger4 = Burger.new({
        "name" => "Donner Burgers",

        })

        burger4.save()

        eatery1 = Eatery.new({
          "name" => "Ruby Tuesdays"
          })

          eatery1.save()

          eatery2 = Eatery.new({
            "name" => "Malkys Burger House"
            })

            eatery2.save()

            eatery3 = Eatery.new({
              "name" => "Burger Kid"
              })

              eatery3.save()

              eatery4 = Eatery.new({
                "name" => "Burger Hut"
                })

                eatery4.save()

                eatery5 = Eatery.new({
                  "name" => "Beef Burger Hill"
                  })

                  eatery5.save()

                  deal1 = Deal.new({
                    "label" => "Monday Madness",
                    "day" => "Monday"
                    })

                    deal1.save()

                    deal2 = Deal.new({
                      "label" => "Two for One Tuesday",
                      "day" => "Tuesday"
                      })

                      deal2.save()

                      deal3 = Deal.new({
                        "label" => "Wild Wednesday",
                        "day" => "Wednesday"
                        })

                        deal3.save()

                        deal4 = Deal.new({
                          "label" => "Tricky Thursday",
                          "day" => "Thursday"
                          })

                          deal4.save()

                          deal5 = Deal.new({
                            "label" => "Fair Friday",
                            "day" => "Friday"
                            })

                            deal5.save()

                            binding.pry
                            nil
