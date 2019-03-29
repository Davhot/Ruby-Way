# Нужно, чтобы был установлен spell - программа для проверки английских слов
check = IO.popen("spell", "r+")
check.puts("'T was brilling, and the slithy toves")
check.puts("Did gyre and gimble in the wabe")
check.close_write
list = check.readlines
list.collect!{ |x| x.chomp}
p list


IO.popen("-") do |mypipe|
  if mypipe
    puts "I'm parent: pid = #{Process.pid}"
    listen = mypipe.gets
    puts listen
  else
    puts "I'm child: pid = #{Process.pid}"
  end
end
