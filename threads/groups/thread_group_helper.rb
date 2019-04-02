class ThreadGroup
  def wakeup
    list.each { |t| t.wakeup }
  end

  def join
    list.each { |t| t.join if t != Thread.current }
  end

  def kill
    list.each { |t| t.kill }
  end

  def all_alive?
    count = 0
    list.each{|x| count += 1 if x.alive?}
    count == list.size
  end
end

# По умолчанию потоки содержатся в группе "Default"
t1 = Thread.new("file1") { sleep 1 }
t2 = Thread.new("file2") { sleep 1 }

thread_group = ThreadGroup.new
thread_group.add t1
thread_group.add t2

# все ли потоки живы
p thread_group.all_alive?
