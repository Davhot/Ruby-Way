puts "\u00E9p\u00E9e"
sword = "épée"
puts sword.length
puts sword.bytes.to_s
puts sword.bytes.length

puts
puts (cp = sword.codepoints).to_s
puts cp.map{|c| c.to_s(16)}.to_s
puts sword.scan(/./).to_s
