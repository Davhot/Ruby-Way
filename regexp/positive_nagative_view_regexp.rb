def apply_regexp(regexp, string)
  str = "string: #{string}".ljust(28) +
    " | regexp: #{regexp}".ljust(53) +
    " | #{regexp.match(string).to_a[0]}"
  puts str
end

s1 = "New World Dictionary"
s2 = "New World Symphony"
s3 = "New World Order"

# позитивное заглядывание. Если в регулярке после New World есть слово Dictionary или Symphony
req = /New World(?= Dictionary| Symphony)/
puts "Positive."
apply_regexp(req, s1)
apply_regexp(req, s2)
apply_regexp(req, s3)

puts
puts "Negative."
# негативное заглядывание. Если в регулярке после New World есть слово Dictionary или Symphony
req2 = /New World(?! Symphony)/
apply_regexp(req2, s1)
apply_regexp(req2, s2)
apply_regexp(req2, s3)
