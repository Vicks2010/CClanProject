require_relative ( '../db/sql_runner')

class EateryBurger

  attr_reader :id
  attr_accessor :burger_id, :eatery_id,

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @burger_id = options['burger_id'].to_i
    @eatery_id = options['eatery_id'].to_i
  end

  def save()
    sql = "INSERT INTO eatery_burgers
    (
      burger_id,
      eatery_id
      )
      VALUES
      (
        $1, $2
      )
      RETURNING id"
      values = [@burger_id, @eatery_id]
      results = SqlRunner.run(sql, values)
      @id = results.first()['id'].to_i
    end

def self.all
  sql = "SELECT * eatery_burgers"
  results = SqlRunner.run( sql )
  return results.map { |eatery_burger| EateryBurger.new( eatery_burger )  }
end

def self.find( id )
  sql = "SELECT * FROM deals
  WHERE id = $1"
  values = [id]
  results = SqlRunner.run( sql, values )
  return EateryBurger.new( results.first )
end

def day
  sql = "INSERT * FROM deals
  INTO eateries
  WHERE eatery_id = id"
  values = [eatery_id]
  results = SqlRunner.run( sql, values )
  return EateryBurger.new( results.first )
end

  end
