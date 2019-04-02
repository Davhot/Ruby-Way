# Если вычисление факториала превышает время sleep - вызов raise
factorial1000 = Thread.new do
  begin
    prod = 1
    1.upto(1000) {|n| prod *= n}
    puts "1000! = #{prod}"
  rescue

  end
end

sleep 0.0001
if factorial1000.alive?
  factorial1000.raise("Stop!")
  puts "Вычисление было прервано!"
else
  puts "Вычисление успешно завершено"
end
