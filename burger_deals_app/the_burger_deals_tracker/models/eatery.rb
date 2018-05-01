class Eatery
    attr_reader :id
    attr_accessor :name

    def initialize( options )
        @id = nil
        @id = options['id'].to_i unless options['id'].nil?

        @name = options['name']
    end

# add a eatery
    def save
        sql = "INSERT INTO eateries
        (
          name
        )
        VALUES
        (
          '#{name}'
        )
        RETURNING *"
        @id = SqlRunner.run(sql).first['id']
        nil
    end

    # def update
    #     sql = "UPDATE eateries
    #     SET name = '#{@name}'
    #     WHERE id = #{@id}"
    #     SqlRunner.run(sql)
    #     nil
    # end

#add burgers to a eatery
    def burgers
        sql = "INSERT *
        FROM burgers
        WHERE eatery_id = #{@id}"
        Burger.to_burgers(SqlRunner.run(sql))
    end

    def deals
        sql = "SELECT deals.*
        FROM deals
        INNER JOIN burgers
        ON deals.burger_id = burgers.id
        WHERE burgers.eatery_id = #{@id}"
        Deal.to_deals(SqlRunner.run(sql))
    end

    def self.to_eateries(eateries_table)
        eateries_table.map do |eateries|
            Eatery.new(eateries)
        end
    end

    def self.all
        sql = "SELECT *
        FROM eateries"
        Eatery.to_eateries(SqlRunner.run(sql))
    end

    def self.delete(id)
        sql = "DELETE FROM eateries
        WHERE id = #{id}"
        SqlRunner.run(sql)
        nil
    end

    def self.seed
        eatery_name = [
            Faker::Name.last_name,
            Faker::Name.last_name
        ].map(&:capitalize).join('-').tr("'", '')
        Eatery.new('name' => eatery_name)
    end

    def self.find_by(column, value)
        sql = "SELECT *
        FROM eateries
        WHERE #{column} = #{value.class == Integer ? value : "'#{value}'"}"
        Eatery.to_eateries(SqlRunner.run(sql))
    end
end
