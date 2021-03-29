# ruby 2.5.1p57 (2018-03-29 revision 63029) [x86_64-linux-gnu]

require 'socket'

HOST = '0.0.0.0'
PORT = 8100

listener = TCPServer::new(PORT)
puts "listening on #{HOST} #{PORT}"

loop do
  Thread.new(listener.accept) do |socket|
    begin
      loop { socket.puts(socket.gets) }
    rescue => exception
      puts exception.message
    ensure
      socket.close
    end
  end
end
