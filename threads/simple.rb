thread = Thread.new do
  t = Thread.current
  t[:var1] = "This is test"
  t[:var2] = 365
end

sleep 1

p thread[:var1]
p thread[:var2]

p thread.key?("var2")
p thread.key?("var3")
