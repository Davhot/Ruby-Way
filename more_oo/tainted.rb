# ruby tainted.rb 3*79

str1 = "puts 'Answer is'"
str2 = ARGV.first.dup # "3*79"

# Показывает запятнана ли строка. Строка запятнана, если она берётся из внешнего
# источика. То же касается любого объекта.
p str1.tainted?
p str2.tainted?

# Делаем запятнаной str1, str2 - нет
str1.taint
str2.untaint

eval(str1)
puts eval(str2)

# Меняем уровень безопасности
$SAFE = 1

eval(str1)
puts eval(str2) # ошибка SecurityError
