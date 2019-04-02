# Программа находит максимальный элемент в массивах за отведённое ей время.
# Если время вышло - программа вернёт максимальное значение на текущий момент.
require 'thread'

def threaded_max(interval, collections)
  threads = []
  collections.each do |col|
    threads << Thread.new do
      cur = Thread.current
      cur[:result] = col.first
      col.each do |n|
        cur[:result] = n if n > cur[:result]
      end
    end
  end

  sleep(interval)

  threads.each {|t| t.kill}
  results = threads.map{|t| t[:result]}

  results.compact.max
end

t = Time.now
collections = Array.new(3, (0..10_000_000).to_a)
puts "Create collection: #{Time.now - t}s"

t = Time.now
biggest = threaded_max(1, collections)
puts "Parallel method: #{Time.now - t}s"

p biggest

t = Time.now
p collections.map{|x| x.max}.max
puts "Сonsequentially method: #{Time.now - t}s"
