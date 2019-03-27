require 'strscan'
str = "Some not so long string"
ss = StringScanner.new(str)
loop do
  word = ss.scan(/\w+/)
  break if word.nil?
  puts word
  sep = ss.scan(/\W+/)
  break if sep.nil?
end
