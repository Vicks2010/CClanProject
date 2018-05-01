require_relative ( '../db/sql_runner' )

class DealBurger

  attr_reader :id
  attr_accessor :deal_id, :burger_id

def initialize( options )
  @id = options['id'].to_i if options['id']
  @deal_id = options['deal_id'].to_i
  @burger_id = options['burger_id'].to_i
end

def save()
  sql = "INSERT INTO deal_burgers
  (
    deal_id,
    burger_id
    )
    VALUES
    (
      $1, $2
      )
      RETURNING id"
      values = [@deal_id, @burger_id]
      results = SqlRunner.run(sql, vaklues)
      @id = results.first()['id'].to_i
end

def self.all
  sql = "SELECT * deal_burgers"
  results = SqlRunner.run( sql )
  return results.map { |deal_burgers| DealBurger.new( DealBurger )}
end

# add a deal to a eatery using a list of burgers,the deal applies to
def deal
  sql = "SELECT * FROM deal_burgers
  WHERE eatery_id = id"
  values = [@eatery_id]
  results = SqlRunner.run( sql, values)
  return Deal.new(results.first)
end

end
