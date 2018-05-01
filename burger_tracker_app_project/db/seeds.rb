require_relative( "../models/burger.rb" )
require_relative( "../models/eatery.rb" )
require_relative( "../models/deal.rb" )
require("pry-byebug")

Burger.delete_all()
Eatery.delete_all()
Deal.delete_all()

burger1 = Burger.new({
  "name" => "Hamburgers",
  "eatery" => "Ruby Tuesdays"
  })

  burger1.save()

  burger2 = Burger.new({
    "name" => "Beef Burgers",
    "eatery" => "Malkys Burger House"
    })

    burger2.save()

    burger3 = Burger.new({
      "name" => "Chicken Burgers",
      "eatery" => "Burger Kid"
      })

      burger3.save()

      burger4 = Burger.new({
        "name" => "Donner Burgers",
        "eatery" => "Burger Hut"
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
                    "name" => "Monday Madness",
                    "day" => "Monday",
                    "eatery_id" => eatery1_id
                    })

                    deal1.save()

                    deal2 = Deal.new({
                      "name" => "Two for One Tuesday",
                      "day" => "Tuesday",
                      "eatery_id" => eatery2_id
                      })

                      deal2.save()

                      deal3 = Deal.new({
                        "name" => "Wild Wednesday",
                        "day" => "Wednesday",
                        "eatery_id" => eatery3_id
                        })

                        deal3.save()

                        deal4 = Deal.new({
                          "name" => "Tricky Thursday",
                          "day" => "Thursday",
                          "eatery_id" => eatery4_id
                          })

                          deal4.save()

                          deal5 = Deal.new({
                            "name" => "Fair Friday",
                            "day" => "Friday",
                            "eatery_id" => eatery5_id
                            })

                            deal5.save()

                            binding.pry
                            nil
