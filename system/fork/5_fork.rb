proc1 = Process.pid
fork do
  puts "proc1 is my parent" if Process.ppid == proc1
end
