class Deal
    attr_reader :id
    attr_accessor :label, :burger_id, :day_id,
                  :total_burgers_recieved, :percentage_of_one_burger_paid

    def initialize( options )
        @id = nil
        @id = options['id'].to_i unless options['id'].nil?

        @name = options['name']
        @burger_id = options['burger_id'].to_i
        @day_id = options['day_id'].to_i
        # @total_burgers_recieved =
        #     parameters['total_burgers_recieved'].to_i
        # @percentage_of_one_burger_paid =
        #     parameters['percentage_of_one_burger_paid'].to_i
    end

    def save
        sql = "INSERT INTO deals
        (name, burger_id, day_id)
        values
        ('#{@name}', #{@burger_id}, #{@day_id})
        RETURNING *"
        @id = SqlRunner.run(sql).first['id']
        nil
    end

    def update
        sql = "UPDATE deals
        SET
        label = '#{@name}',
        burger_id = #{@burger_id},
        day_id = #{@day_id},
        WHERE id = #{@id}"
        SqlRunner.run(sql)
        nil
    end

    def burgers
        sql = "SELECT *
        FROM burgers
        WHERE id = #{@burger_id}"
        Burger.to_burgers(SqlRunner.run(sql))
    end

    def days
        sql = "SELECT *
        FROM days
        WHERE id = #{@day_id}"
        Day.to_days(SqlRunner.run(sql))
    end


    def self.to_deals(deal_table)
        deal_table.map do |deal|
            Deal.new(deal)
        end
    end

    def self.all
        sql = "SELECT *
        FROM deals"
        Deal.to_deals(SqlRunner.run(sql))
    end

    def self.delete(id)
        sql = "DELETE FROM deals
        WHERE id = #{id}"
        SqlRunner.run(sql)
        nil
    end

    # def self.seed(burger_id)
    #     deal_day_id = Day.all.sample.id
    #
    #     case rand(1..3)
    #     when 1
    #         total_burgers_recieved = 1
    #         percentage_of_one_burger_paid = rand(5..15) * 5
    #         deal_label = Deal.label_x_percent_off(percentage_of_one_burger_paid)
    #
    #     when 2
    #         percentage_of_one_burger_paid = rand(1..2) * 100
    #         total_burgers_recieved =
    #             (percentage_of_one_burger_paid / 100) + rand(1..2)
    #         deal_label = Deal.label_get_x_for_price_of_y(percentage_of_one_burger_paid, total_burgers_recieved)
    #
    #     when 3
    #         percentage_of_one_burger_paid = rand(1..2) * 100
    #         total_burgers_recieved =
    #             (percentage_of_one_burger_paid / 100) + rand(1..2)
    #         deal_label = Deal.label_buy_x_get_y_free(percentage_of_one_burger_paid, total_burgers_recieved)
    #
    #     end

        Deal.new('name' => deal_name,
                 'burger_id' => burger_id,
                 'day_id' => deal_day_id,
    end

    def self.find_by(column, value)
        sql = "SELECT *
        FROM deals
        WHERE #{column} = #{value.class == Integer ? value : "'#{value}'"}"
        Deal.to_deals(SqlRunner.run(sql))
    end

    # def self.label_buy_x_get_y_free(percentage_of_one_burger_paid, total_burgers_recieved)
    #     "buy #{percentage_of_one_burger_paid / 100} get #{total_burgers_recieved - (percentage_of_one_burger_paid / 100)} free"
    # end
    #
    # def self.label_get_x_for_price_of_y(percentage_of_one_burger_paid, total_burgers_recieved)
    #     "get #{total_burgers_recieved} for the price of #{percentage_of_one_burger_paid / 100} "
    # end
    #
    # def self.label_x_percent_off(percentage_of_one_burger_paid)
    #     "#{100 - percentage_of_one_burger_paid}% off"
    # end
end
