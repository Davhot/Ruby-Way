# Начиная с Ruby 2.3 пишет
# Thread.exclusive is deprecated, use Mutex

def new_value(i)
  i + 1
end

x = 0

t1 = Thread.new do
  1.upto(1_000_000) do
    Thread.exclusive { x = new_value(x) }
  end
end

t2 = Thread.new do
  1.upto(1_000_000) do
    Thread.exclusive { x = new_value(x) }
  end
end

t1.join
t2.join

puts x
