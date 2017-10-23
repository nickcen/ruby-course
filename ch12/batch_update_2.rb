require 'mysql2'
require 'benchmark'


client = Mysql2::Client.new(host: 'localhost', username: 'test', password: 'test', database: 'test')

def prepare_statement(client)
  statement = client.prepare("update users set name = ? where id = ?")

  1.upto(100000).each do |i|
    statement.execute("nuser_#{i}", i)
  end
end

puts Benchmark.measure{ prepare_statement(client) }