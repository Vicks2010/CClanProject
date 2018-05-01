# require( 'pg')
#
# class SqlRunner
#
# def self.run( sql, values = [] )
#   begin
#     db = PG.connect({ dbname: 'burger_deals', host: 'localhost'})
#     db.prepare("query", sql)
#     result = db.exec_prepared( "query", values )
#   ensure
#     db.close() if db != nil
#   end
#   return result
# end
#
# end

# require( 'pg')
# class SqlRunner
#     def self.run(sql)
#         begin
#             db = PG.connect({dbname: 'burger_deals', host: 'localhost'})
#             query_result = db.exec(sql)
#         ensure
#             db.close
#         end
#         query_result
#     end
#
#     def self.reset_table
#
#         sql = ''
#         File.open('db/burger_deals.sql').each do |line|
#             sql += line
#         end
#         sql.split(';').each do |query|
#             SqlRunner.run(query)
#         end
#     end
# end

#BurgersNdeals

require( 'pg')

class SqlRunner

def self.run( sql, values = [] )
  begin
    db = PG.connect({ dbname: 'burger_deals', host: 'localhost'})
    db.prepare("query", sql)
    result = db.exec_prepared( "query", values )
  ensure
    db.close() if db != nil
  end
  return result
end

end
