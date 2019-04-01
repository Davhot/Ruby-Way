count = 50
ObjectSpace.each_object do |obj|
  break if count == 0
  count -= 1
  printf "%20s: %s\n", obj.class, obj.inspect
end

puts
require 'pp'
p ObjectSpace.count_objects
