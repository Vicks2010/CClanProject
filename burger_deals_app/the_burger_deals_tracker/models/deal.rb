# require_relative ( '../db/sql_runner' )

class Deal

  attr_accessor :label, :day
  attr_reader :id

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @label = options['label']
    @day = options['day']
  end

  def save()
    sql = "INSERT INTO deals
    (
      label_id,
      day_id
      )
      VALUES
      (
        $1, $2
        )
        RETURNING id"
        values = [@label, @day]
        results = SqlRunner.run(sql, values)
        @id = results.first()['id'].to_i
  end

def self.all()
  sql = "SELECT * deals"
  results = SqlRunner.run( sql )
  return results.map { |deal| Deal.new( deal )}
end

def self.find( id )
  sql = "SELECT * FROM deals
  WHERE id = $1"
  values = [id]
  results = SqlRunner.run( sql, values )
  return Deal.new( results.first )
end

# add a deal to a eatery
def eatery()
  sql = "INSERT * INTO eateries
  WHERE id = $1"
  values = [@eatery_id]
  results = SqlRunner.run( sql, values )
  return Eatery.new( results.first )
end



# def burger
#   sql = "SELECT * FROM burgers
#   WHERE id = $1"
#   values = [@burger_id]
#   results = SqlRunner.run( sql, values )
#   return Burger.new( results.first)
# end

def self.delete_all
    sql = "DELETE FROM deals"
    SqlRunner.run( sql )
  end

end
