require 'mysql2'
require 'benchmark'


client = Mysql2::Client.new(host: 'localhost', username: 'test', password: 'test', database: 'test')

def prepare_statement(client)
  statement = client.prepare("insert into users (name, age) values (?, ?)")

  1.upto(100000).each do |i|
    statement.execute("user_#{i}", i)
  end
end

puts Benchmark.measure{ prepare_statement(client) }