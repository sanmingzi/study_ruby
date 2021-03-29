# can not run
# maybe the gem revactor is deprecated
# https://github.com/tarcieri/revactor

require 'revactor'

HOST = '0.0.0.0'
PORT = 8100

listener = Revactor::TCP::listen(HOST, PORT)
puts "listening on #{HOST} #{PORT}"

loop do
  Actor.spawn(listener.accept) do |socket|
    puts "#{socket.remote_addr}:#{socket.remote_port} connected"

    loop do
      begin
        socket.write socket.read
      rescue => exception
        puts "#{socket.remote_addr}:#{socket.remote_port} disconnected"
        break
      end
    end
  end
end
