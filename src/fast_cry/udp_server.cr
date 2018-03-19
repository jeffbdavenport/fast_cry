module FastCry
  class UDPServer < Server
    def initialize(host = LOCALHOST, port = 18998)
      super(UDPSocket.new, host, port)
    end
  end
end
