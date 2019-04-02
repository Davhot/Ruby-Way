# По умолчанию потоки содержатся в группе "Default"
t1 = Thread.new("file1") { sleep 1 }
t2 = Thread.new("file2") { sleep 1 }

thread_group = ThreadGroup.new
thread_group.add t1
thread_group.add t2

# Подсчитать все живые потоки
count = 0
thread_group.list.each{|x| count += 1 if x.alive?}
if count < thread_group.list.size
  puts "Has dead threads"
else
  puts "All threads alive"
end
