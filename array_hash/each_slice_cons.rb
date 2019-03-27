a = *1..10
a.each_slice(3) do |triple|
  puts triple.join(?,)
end

puts
a.each_cons(3) do |triple|
  puts triple.join(?,)
end
