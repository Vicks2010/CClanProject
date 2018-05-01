class Day
    attr_reader :id, :name

    def initialize( options )
        @id = nil
        @id = options['id'].to_i unless options['id'].nil?

        @name = options['name']
    end

    def save
        sql = "INSERT INTO days
        (name)
        values
        ('#{@name}')
        RETURNING *"
        @id = SqlRunner.run(sql).first['id']
        nil
    end

    def deals
        sql = "SELECT *
        FROM deals
        WHERE day_id = #{@id}"
        Deal.to_deals(SqlRunner.run(sql))
    end

    def self.to_days(day_table)
        day_table.map do |day|
            Day.new(day)
        end
    end

    def self.all
        sql = "SELECT *
        FROM days"
        Day.to_days(SqlRunner.run(sql))
    end

    def self.generate
        days = %w(Monday Tuesday Wednesday Thursday Friday Saturday Sunday)
        days.each do |day|
            Day.new('name' => day).save
        end
        nil
    end
end
