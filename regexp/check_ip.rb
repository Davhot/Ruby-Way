# IPv4
num = /(\d)|[01]?\d\d|2[0-4]\d|25[0-5]/
pat = "^(#{num}\\.){3}#{num}"
ip_pat = Regexp.new(pat)

puts "99.113.97.1" =~ ip_pat
puts "257.113.97.1" =~ ip_pat

# IPv6
num = /[0-9A-Fa-f]{0,4}/
pat = "^(#{num}:){7}#{num}"
ip_pat = Regexp.new(pat)

puts "abcd:123:1::1:::1c" =~ ip_pat
puts "abcd:123:1:q::1::" =~ ip_pat
