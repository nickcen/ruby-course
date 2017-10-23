require 'mysql2'
require 'benchmark'


client = Mysql2::Client.new(host: 'localhost', username: 'test', password: 'test', database: 'test')

def direct_insert(client)
  1.upto(100000).each do |i|
    client.query("insert into users (name, age) values ('users_#{i}', #{i})")
  end
end

puts Benchmark.measure{ direct_insert(client) }