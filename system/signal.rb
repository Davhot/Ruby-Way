pid = fork do
  trap("SIGHUP") do
    puts "Catch event in child pid = #{Process.pid}"
  end

  puts "begin pid = #{Process.pid}"
  puts "Some exec..."
  sleep 2
  puts "end pid = #{Process.pid}"
end

sleep 1
Process.kill("SIGHUP", pid)
Process.wait


# Отправка самому себе
trap("SIGHUP") do
  puts "Catch event in parent pid = #{Process.pid}"
end
Process.kill("HUP", 0) # HUP - эквивалент SIGHUB
