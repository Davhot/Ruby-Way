Dir.chdir('/var/tmp')
puts Dir.pwd
Dir.chdir("/tmp") do
  puts Dir.pwd
end
puts Dir.pwd

puts "\nДиректория /tmp содержит:"
dir = Dir.new("/tmp")
dir.each{ |entry| puts entry }

list = Dir.entries("/tmp")
p list
