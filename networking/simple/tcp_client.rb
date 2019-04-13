require 'socket'

session = TCPSocket.new("localhost", 12321)
puts "Time is #{session.gets.chomp}"
session.close
