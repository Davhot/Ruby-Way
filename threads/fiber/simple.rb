fiber = Fiber.new do
  x = 2
  Fiber.yield x
  x *= 2
  Fiber.yield x
  x * 2
end

begin
  4.times{ p fiber.resume }
rescue => e
  puts "End fiber: #{e.message}"
end
