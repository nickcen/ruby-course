require 'mysql2'

client = Mysql2::Client.new(host: 'localhost', username: 'test', password: 'test', database: 'information_schema')

client.query("select * from tables where table_schema = 'test'").each do |table|
  puts "------ TABLE:#{table['TABLE_NAME']} ------"

  client.query("select * from columns where table_schema = 'test' and table_name = '#{table['TABLE_NAME']}'").each do |column|
    puts "#{column['COLUMN_NAME']} | #{column['COLUMN_TYPE']}"
  end

end