t = Thread.new {sleep 1; Thread.main.join}
t.join # Взаимоблокировка!
