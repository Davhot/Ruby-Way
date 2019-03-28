# Пример глубокого копирования значений, используя маршалинг

def deep_copy(obj)
  Marshal.load(Marshal.dump(obj))
end

puts "Without deep_copy"
a = [[1, 2, 3]]
b = a
p a
b[0][0] = 4
p a
p b

puts "deep_copy"
a = [[1, 2, 3]]
b = deep_copy(a)
p a
b[0][0] = 4
p a
p b
