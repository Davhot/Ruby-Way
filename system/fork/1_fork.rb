pid = fork
if pid.nil?
  puts "Child"
else
  puts "Parent"
end
