def power(exponent)
  proc{|base| base ** exponent}
end

square = power(2)
cube = power(3)

puts square.call(10)
puts cube.call(10)
