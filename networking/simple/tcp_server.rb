require "socket"

server = TCPServer.new(12321)

loop do
  session = server.accept # ожидание
  session.puts Time.now
  session.close
end
