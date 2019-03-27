require 'zlib'
include Zlib

def get_time(&block)
  t = Time.now
  val = block.call
  [val, Time.now - t]
end

long_string = ("abcde" * 171 + "defghi" * 179 + "ghijkl" * 1113) * 11371

s1, t1 = get_time{ Deflate.deflate(long_string, BEST_SPEED) }
s2, t2 = get_time{ Deflate.deflate(long_string) }
s3, t3 = get_time{ Deflate.deflate(long_string, BEST_COMPRESSION) }

puts "string size: #{long_string.size}"
puts "BEST_SPEED compression size: #{s1.size} | time: #{t1}"
puts "optimal compression size: #{s2.size} | time: #{t2}"
puts "BEST_COMPRESSION compression size: #{s3.size} | time: #{t3}"
