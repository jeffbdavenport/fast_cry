module FastCry
  class TCPServer < Server
    def initialize(host = LOCALHOST, port = 19998)
      super(TCPSocket.new, host, port)
    end
  end
end
