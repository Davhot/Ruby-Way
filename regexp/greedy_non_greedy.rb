def apply_regexp(regexp, string)
  str = "string: #{string}" +
    " | regexp: #{regexp}" +
    " | #{regexp.match(string).to_a[0]}"
  puts str
end

str = "Where the sea meets the moon-blanch'd land,"

puts "Greedy."
# Жадный поиск
req = /.*the/
apply_regexp(req, str)

puts
puts "Nongreedy."
# Нежадный поиск
req = /.*?the/
apply_regexp(req, str)
