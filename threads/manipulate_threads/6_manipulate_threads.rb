# wakeup - поток готов к выполнению, но не запускается немедленно (запускается планировщиком)
# run - поток готов к выполнению и сразу запускается
t1 = Thread.new do
  Thread.stop
  puts "t1"
end

t2 = Thread.new do
  Thread.stop
  puts "t2"
end

sleep 0.5

t1.wakeup
t2.run

sleep 0.5 # если не подождать, ничего не напечатается, так как потоки ещё не выполнятся
