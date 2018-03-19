require "socket"

module FastCry
  class Server
    getter :port, :host, :server
    LOCALHOST = "localhost"

    def initialize(@server : TCPSocket | UDPSocket, @host : String, @port : Int32)
      puts "Binding port #{@port} for #{@server.class} on #{@host}"
      @server.bind(@host, @port)
    end

    def listen
      puts "#{self.class} Listening on port #{@port}"
      while !server.closed?
        message, address = server.receive
        yield(Request.new(self, message.chomp, address))
      end
      STDERR.puts "#{self.class} closed!"
    end

    def send(message, address)
      @server.send("#{message}\n", address)
    end
  end
end
