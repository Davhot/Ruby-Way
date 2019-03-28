require 'tempfile'

temp = Tempfile.new("stuff")
name = temp.path
puts name
temp.puts "Some message"
temp.close

temp.open
str = temp.gets
puts str
temp.close(true)
