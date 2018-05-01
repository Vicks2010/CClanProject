require_relative ( '../db/sql_runner' )

class Burger
   attr_reader :id
   attr_accessor :name

   def initialize( options )
       @id = nil
       @id = options['id'].to_i unless options['id'].nil?
       @name = options['name']

   end

   def save
       sql = "INSERT INTO burgers
       (name)
       values
       '#{@name}'
       RETURNING *"
       @id = SqlRunner.run(sql).first['id']
       nil
   end

   def update
       sql = "UPDATE burgers
       SET
       name = '#{@name}',
       WHERE id = #{@id}"
       SqlRunner.run(sql)
       nil
   end

# view the burgers of a eatery
   def eateries
       sql = "SELECT *
       FROM burgers
       WHERE id = #{@eatery_id}"
       Eatery.to_eateries(SqlRunner.run(sql))
   end

   def deals
       sql = "SELECT *
       FROM deals
       WHERE burger_id = #{@id}"
       Deal.to_deals(SqlRunner.run(sql))
   end

   def type_of_burgers
       TypeOfBurger.find_by('burger_id', @id)
   end

   def self.to_burgers(burger_table)
       burger_table.map do |burger|
           Burger.new(burger)
       end
   end

   def self.all
       sql = "SELECT *
       FROM burgers"
       Burger.to_burgers(SqlRunner.run(sql))
   end

   # def self.delete(id)
   #     sql = "DELETE FROM burgers
   #     WHERE id = #{id}"
   #     SqlRunner.run(sql)
   #     nil
   # end

   def self.seed
       available_eartery_ids = Eatery.all.map(&:id)

       burger_name = [
           Faker::Address.country.split.first,
           'burger'
       ].map { |name| name.capitalize.tr("'", '') }.join(' ')

       eatery_id = available_eartery_ids.sample


       Burger.new('name' => burger_name)
   end

   def self.find_by(column, value)
       sql = "SELECT *
       FROM burgers
       WHERE #{column} = #{value.class == Integer ? value : "'#{value}'"}"
       Burger.to_burgers(SqlRunner.run(sql))
   end
end
