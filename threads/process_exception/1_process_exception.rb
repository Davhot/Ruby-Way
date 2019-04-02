# Исключение не возбуждается, пока не будет вызван join или value
t1 = Thread.new do
  puts "Hello"
  sleep 1
  raise "Exception"
end

t2 = Thread.new do
  sleep 2
  puts "Hello from second thread"
end

sleep 3
puts "end"
