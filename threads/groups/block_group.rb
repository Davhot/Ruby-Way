# Можно "запирать" потоки внутри одной группы, тем самым не давая делать операции над группой
t = ThreadGroup.new
t.enclose
p t.enclosed?
t.add Thread.new{ sleep 1 }
