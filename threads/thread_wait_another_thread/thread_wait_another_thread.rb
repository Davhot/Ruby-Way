# Дождаться потока можно при помощи join
t1 = Thread.new do
  puts "Some text begin"
  sleep 3
  puts "Some text end"
end


t2 = Thread.new do
  sleep 2
  42
end

# Дождаться всех потоков: Thread.list.each{ |t| t.join if t != Thread.current }
t1.join

# метод value, возвращающий значение потока, неявно вызывает join
puts "Secret value is #{t2.value}"
