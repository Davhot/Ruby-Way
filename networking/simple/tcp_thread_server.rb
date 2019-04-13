require "socket"

server = TCPServer.new(12321)

loop do
  Thread.new(server.accept) do |session|
    session.puts Time.now
    session.close
  end
end
