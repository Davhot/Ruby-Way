=begin
$ ruby -disable-gems -r tracer 2_monitoring.rb
Типы событий:
  '-' - исполняется строка исходного текста
  '>' - вызов
  '<' - возврат
  'C' - класс
  'E' - конец
=end

def factorial(n)
  (1..n).inject(:*) || 1
end

factorial(4)
