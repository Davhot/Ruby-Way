require 'thread'

buffer = SizedQueue.new(2) # потокобезопасен

producer = Thread.new do
  item = 0
  loop do
    sleep rand * 0.1
    puts "Производитель произвёл #{item}"
    buffer.enq item
    item += 1
  end
end

consumer = Thread.new do
  loop do
    sleep ((rand * 0.1) + 0.09)
    item = buffer.deq
    puts "Потребитель потребил #{item}"
    puts "  ожидает = #{buffer.num_waiting}" # сколько процессов ожидают очереди
  end
end

sleep 10
