require_relative ( '../db/sql_runner' )

class EateryDeal

  attr_reader :id
  attr_accessor :deal_id, :eatery_id

def initialize( options )
  @id = options['id'].to_i if options['id']
  @deal_id = options['deal_id'].to_i
  @eatery_id = options['eat'].to_i
end

def save()
  sql = "INSERT INTO eatery_deals
  (
    deal_id,
    eatery_id
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
  sql = "SELECT * eatery_deals"
  results = SqlRunner.run( sql )
  return results.map { |burger_in_deal| BurgerInDeal.new( BurgerInDeal )}
end

# ADD deal into eatery using label
def deal
  sql = "INSERT * FROM deals
  INTO eateries
  WHERE label_id = $1"
  values = [@label_id]
  results = SqlRunner.run( sql, values)
  return Deal.new(results.first)
end

end
