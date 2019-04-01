require 'forwardable'

class MyQueue
  extend Forwardable

  def initialize(obj = [])
    @queue = obj
  end

  def_delegator :@queue, :push, :enqueue
  def_delegator :@queue, :shift, :dequeue

  def_delegators :@queue, :clear, :empty?, :length, :size, :<<
end

mq = MyQueue.new
mq.enqueue(123)
mq.enqueue(234)

p mq.empty?
p mq.dequeue
p mq.dequeue
p mq.empty?
