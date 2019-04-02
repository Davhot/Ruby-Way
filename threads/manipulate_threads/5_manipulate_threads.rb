t1 = Thread.new { $SAFE = 1; sleep 5 }
t2 = Thread.new { $SAFE = 2; sleep 5 }

sleep 1

p Thread.main.safe_level
p t1.safe_level
p t2.safe_level
