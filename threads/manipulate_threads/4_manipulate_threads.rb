t1 = Thread.new { loop {} }
t2 = Thread.new { sleep 5 }
t3 = Thread.new { Thread.stop }
t4 = Thread.new { Thread.exit }
t5 = Thread.new { raise "exception" }

sleep 1

p t1.status
p t2.status
p t3.status
p t4.status
p t5.status
