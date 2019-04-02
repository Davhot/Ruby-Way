t1 = Thread.new do
  puts "Hello"
  sleep 1
  raise "Oh no!"
end

# Использовать только во время отладки!
# эквивалентно Thread.list.each(&:kill)
t1.abort_on_exception = true # Если установлен, то при исключении прерываются ВСЕ потоки

t2 = Thread.new do
  sleep 2
  puts "Hello thread №2"
end

sleep 3
puts "End"
