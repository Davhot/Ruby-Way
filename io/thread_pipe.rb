reader, writer = IO.pipe

str = nil
thread1 = Thread.new(reader, writer) do |reader, writer|
  str = reader.gets
  reader.close
end

thread2 = Thread.new(reader, writer) do |reader, writer|
  writer.puts "My message"
  writer.close
end

thread1.join
thread2.join

puts str
