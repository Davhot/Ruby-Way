# Именованное выражение в регулярках
# Синтаксис: (?<name>expr)

# Пример 1
str = "Now is the the time for all"
req = /\s+(?<anyword>\w+)\s+\k<anyword>/
puts req.match(str).to_a.to_s

# Пример 2
str = "I breathe when I sleep"
req = /I (?<verb1>\w+) when I (?<verb2>\w+)/
puts str.sub(req, 'I \k<verb2> when I \k<verb1>')

m = req.match(str)
puts m[:verb1]
puts m[:verb2]
