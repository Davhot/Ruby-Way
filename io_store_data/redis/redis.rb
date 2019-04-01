require 'redis'

r = Redis.new

# Задать множество и считать значение
r.sadd("pets", "spooky")
p r.smembers("pets")

# Задать хэш
r.hset("spooky", "species", "cat")
r.hset("spooky", "birthday", "2008-10-03")
p r.hget("spooky", "species")
p r.hgetall("spooky")

# Задать отсортированное мноество
r.zadd("pet_weights", 6, "spooky")
r.zadd("pet_weights", 12, "spot")
r.zadd("pet_weights", 2, "maru")

# Выбрать первое значение из множества, отсортированного в порядке убывания
p r.zrevrange("pet_weights", 0, 0)
