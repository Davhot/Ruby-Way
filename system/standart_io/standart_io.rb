# подача на вход аргументов команде и получение данных, а также ошибки
# Для windows - библиотека win32-open3
require 'open3'

filenames = %w(file1 file2 this that another one_more)

output, errout = [], []

Open3.popen3("xargs", "ls", "-l") do |inp, out, err|
  filenames.each { |f| inp.puts f }
  inp.close # необходимо закрывать!

  output = out.readlines
  errout = err.readlines
end

puts "Послано #{filenames.size} строк входных данных"
puts "Получено #{output.size} строк из stdout"
puts "и #{errout.size} строк из errout"

puts output
puts
puts errout
