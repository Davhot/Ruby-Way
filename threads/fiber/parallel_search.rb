# Программа находит максимальный элемент в массивах за отведённое ей время.
# Если время вышло - программа вернёт максимальное значение на текущий момент.
require 'fiber'

class MaxFiber < Fiber
  attr_accessor :result
end

def max_by_fiber(interval, collections)
  fibers = []
  collections.each do |numbers|
    fibers << MaxFiber.new do
      cur = Fiber.current
      cur.result = numbers.first
      numbers.each_with_index do |n, i|
        cur.result = n if n > cur.result
        Fiber.yield cur.result if (i + 1) % 3 == 0
      end
      cur.result
    end
  end

  start_time = Time.now
  while fibers.any? &:alive?
    break if Time.now - start_time > interval
    fibers.each { |f| f.resume if f.alive? }
  end

  values = fibers.map &:result

  values.compact.max || 0
end

t = Time.now
collections = Array.new(3, (0..1_000_000).to_a)
puts "Create collection: #{Time.now - t}s"

t = Time.now
biggest = max_by_fiber(1, collections)
puts "Parallel method: #{Time.now - t}s"

p biggest

t = Time.now
p collections.map{|x| x.max}.max
puts "Сonsequentially method: #{Time.now - t}s"
