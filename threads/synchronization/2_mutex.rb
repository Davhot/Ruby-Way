require 'thread'

mutex = Mutex.new

t1 = Thread.new do
  mutex.lock
  sleep 2
  p "End t1"
end

sleep 1

t2 = Thread.new do
  if mutex.try_lock # не дожидается освобождения, в отличие от lock
    puts "Захватил"
  else
    puts "Не захватил"
  end
end

t2.join
t1.join
