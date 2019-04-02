count = 0
t1 = Thread.new { loop { count += 1 } }
t2 = Thread.new { Thread.stop }

sleep 1

p [t1.alive?, t1.stop?, t2.alive?, t2.stop?]
