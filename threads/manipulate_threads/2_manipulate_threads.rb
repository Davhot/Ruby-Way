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

Thread.kill(t1) # завершить этот поток
Thread.pass # уступить свой квант
t3 = Thread.new do
  sleep 20
  Thread.exit # выйти из потока
end

Thread.kill(t2)

Thread.exit # выйти из главного потока, остальные тоже завершатся
