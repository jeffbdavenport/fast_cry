module FastCry
  class Request
    getter message, address

    def initialize(@server : UDPServer | TCPServer, @message : String, @address : Socket::Address)
    end

    def socket_address
      @address
    end

    def address : String
      @address.to_s.split(':').first
    end

    def port : Int32
      @address.to_s.split(':').last.to_i
    end

    def send(message)
      @server.send(message, @address)
    end
  end
end
