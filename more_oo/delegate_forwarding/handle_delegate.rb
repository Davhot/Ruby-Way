require 'delegate'
class MyQueue
  def initialize(obj = [])
    @queue = obj
  end

  def enqueue(arg)
    @queue.push(arg)
  end

  def dequeue
    @queue.shift
  end

  %w(clear empty? length size <<).each do |name|
    define_method(name){|*args| @queue.send(name, *args)}
  end
end

mq = MyQueue.new
mq.enqueue(123)
mq.enqueue(234)

p mq.empty?
p mq.dequeue
p mq.dequeue
p mq.empty?
