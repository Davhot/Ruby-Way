t1 = Thread.new { sleep 10 }
t2 = Thread.new do
  if Thread.current == Thread.main
    puts "Main Thread"
  end
  1.upto(100) { sleep 0.1 }
end

p Thread.list.size

if Thread.list.include?(Thread.main)
  puts "Main Thread not died"
end

if Thread.current == Thread.main
  puts "Its main thread"
end
