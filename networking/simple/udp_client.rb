require 'socket'
require 'timeout'

socket = UDPSocket.new
socket.connect("localhost", 12321)

socket.send("", 0)
Timeout.timeout(10) do
  time = socket.gets
  puts "Time is #{time}"
end
