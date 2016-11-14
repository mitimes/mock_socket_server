require 'socket'

port, rest = *ARGV
port ||= "8182"

server = TCPServer.new(port)
puts "Listening on port #{port}..."
loop do
  Thread.start(server.accept) do |client|
    client.puts "Hello !"
    client.puts "Time is #{Time.now}"
    client.close
  end
end
