diskfile  = File.new("foofile", "w")
puts "Hi!"
$stdout = diskfile
puts "Bye"
diskfile.close
# аналогично $stdin STDIN $stderr STDERR
$stdout = STDOUT
puts "That's all"
