class TypeOfBurger
    attr_reader :id
    attr_accessor :burger_id, :type_id

    def initialize( options )
        @id = nil
        @id = options['id'].to_i unless options['id'].nil?

        @burger_id = options['burger_id'].to_i
        @type_id = options['type_id'].to_i
    end

    def save
        sql = "INSERT INTO type_of_burgers
        (burger_id, type_id)
        VALUES
        (#{burger_id}, #{type_id})
        RETURNING *"
        @id = SqlRunner.run(sql).first['id']
        nil
    end

    def update
        sql = "UPDATE type_of_burgers
        SET
        burger_id = #{@burger_id},
        type_id = #{@type_id}
        WHERE id = #{@id}"
        SqlRunner.run(sql)
        nil
    end

    def self.to_type_of_burger(type_of_burger_table)
        type_of_burger_table.map do |type_of_burger|
            TypeOfBurger.new(type_of_burger)
        end
    end

    def self.all
        sql = "SELECT *
        FROM type_of_burgers"
        TypeOfBurger.to_type_of_burgers(SqlRunner.run(sql))
    end

    def self.delete(id)
        sql = "DELETE FROM type_of_burgers
        WHERE id = #{id}"
        SqlRunner.run(sql)
        nil
    end

    def self.seed(column, value)
        if column == 'burger_id'
            burger_id = value
            type_id = Type.all.sample.id
        elsif column == 'type_id'
            burger_id = Burger.all.sample.id
            type_id = value
        end
        TypeOfBurger.new('burger_id' => burger_id,
                             'type_id' => type_id)
    end

    def self.find_by(column, value)
        sql = "SELECT *
        FROM type_of_burgers
        WHERE #{column} = #{value.class == Integer ? value : "'#{value}'"}"
        Eatery.to_eateries(SqlRunner.run(sql))
    end
end
