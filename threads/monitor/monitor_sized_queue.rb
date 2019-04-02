require 'monitor'
require_relative 'monitor_queue'

class MySizedQueue < MyQueue
  attr :max
  def initialize(max)
    super()
    @max = max
    @full_cond = @monitor.new_cond
  end

  def enq(obj)
    @monitor.synchronize do
      @full_cond.wait while @queue.length >= @max
      super(obj)
    end
  end

  def deq
    @monitor.synchronize do
      obj = super
      @full_cond.signal if @queue.length < @max
      return obj
    end
  end

  def max=(max)
    @monitor.synchronize do
      @max = max
      @full_cond.broadcast
    end
  end
end

if __FILE__ == $0
  queue = MySizedQueue.new(15)

  t1 = Thread.new { 17.times{queue.enq("Thread 1")} }
  t2 = Thread.new { 17.times{queue.enq("Thread 2")} }
  sleep 0.1
  t3 = Thread.new do
    puts "Begin t1"
    20.times do
      puts queue.deq if queue.size > 0
    end
    puts "End t1"
  end
  # sleep 0.1
  t3 = Thread.new do
    puts "Begin t2"
    14.times do
      puts queue.deq if queue.size > 0
    end
    puts "End t2"
  end

  Thread.list.each{ |t| t.join if t != Thread.current }
end
