# Исключение не возбуждается, пока не будет вызван join или value
t1 = Thread.new do
  raise "Oh no!"
end

begin
  p t1.status
  p t1.join
rescue Exception => e
  puts "Поток возбудил исключение #{e.class}: #{e.message}"
end
