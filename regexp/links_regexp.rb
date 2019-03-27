str = "a123b456c789"
req = /(a\d+)(?:b\d+)(c\d+)/.match(str)

a = []
req.to_a.each_with_index{|x, i| a << "#{i}: #{x}"}
a.shift
puts a.join(' ')

# Начало и окончание вхождения
puts req.begin(2)
puts req.end(2)
puts req.offset(2).to_s
puts str[req.begin(2)...req.end(2)]
