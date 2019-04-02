require 'monitor'

class MyQueue
  def initialize
    @queue = []
    @monitor = Monitor.new
    @empty_condition = @monitor.new_cond
  end

  def enq(obj)
    @monitor.synchronize do
      @queue.push(obj)
      @empty_condition.signal
    end
  end

  def deq
    @monitor.synchronize do
      @empty_condition.wait while @queue.empty?
      return @queue.shift
    end
  end

  def size
    @queue.size
  end
end

if __FILE__ == $0
  queue = MyQueue.new

  t1 = Thread.new { 10.times{queue.enq("Thread 1")} }
  t2 = Thread.new { 10.times{queue.enq("Thread 2")} }
  sleep 1
  t3 = Thread.new do
    20.times do
      puts queue.deq if queue.size > 0
    end
  end

  Thread.list.each{ |t| t.join if t != Thread.current }
end
