require 'active_support/all'
sword = "épée"
chars = ActiveSupport::Multibyte::Chars.new(sword)
puts sword.upcase
puts chars.upcase.to_s

puts
sword_kc = chars.normalize(:kc)
sword_kd = chars.normalize(:kd)
puts sword_kc.bytes.to_s
puts sword_kd.bytes.to_s
puts sword_kc.scan(/./).to_s
puts sword_kd.scan(/./).to_s
