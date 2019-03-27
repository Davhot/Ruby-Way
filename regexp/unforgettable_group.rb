str = "a123b456c789"
puts str.sub(/(a\d+)(b\d+)(c\d+)/, '1st=\1, 2st=\2, 3st=\3')
puts str.sub(/(a\d+)(?:b\d+)(c\d+)/, '1st=\1, 2st=\2, 3st=\3')
