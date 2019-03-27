#!/usr/bin/env ruby
# some useless code...

def power(exponent)
  proc{|base| base ** exponent}
end

square = power(2)
cube = power(3)

puts square.call(10)
puts cube.call(10)

=begin
Array
Arrays are ordered, integer-indexed collections of any object.

Array indexing starts at 0, as in C or Java. A negative index is assumed to be
relative to the end of the array—that is, an index of -1 indicates the last
element of the array, -2 is the next to last element in the array, and so on.

Creating Arrays¶ ↑
A new array can be created by using the literal constructor []. Arrays can
contain different types of objects. For example, the array below contains an Integer,
a String and a Float:

ary = [1, "two", 3.0] #=> [1, "two", 3.0]
An array can also be created by explicitly calling ::new with zero,
one (the initial size of the Array) or two arguments (the initial size and a default object).

ary = Array.new    #=> []
Array.new(3)       #=> [nil, nil, nil]
Array.new(3, true) #=> [true, true, true]
=end


# some useless code...

def power(exponent)
  proc{|base| base ** exponent}
end

square = power(2)
cube = power(3)

puts square.call(10)
puts cube.call(10)

=begin
Array
Arrays are ordered, integer-indexed collections of any object.

Array indexing starts at 0, as in C or Java. A negative index is assumed to be
relative to the end of the array—that is, an index of -1 indicates the last
element of the array, -2 is the next to last element in the array, and so on.

Creating Arrays¶ ↑
A new array can be created by using the literal constructor []. Arrays can
contain different types of objects. For example, the array below contains an Integer,
a String and a Float:

ary = [1, "two", 3.0] #=> [1, "two", 3.0]
An array can also be created by explicitly calling ::new with zero,
one (the initial size of the Array) or two arguments (the initial size and a default object).

ary = Array.new    #=> []
Array.new(3)       #=> [nil, nil, nil]
Array.new(3, true) #=> [true, true, true]
=end
