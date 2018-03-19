require "./fast_cry/*"

module FastCry
  extend self

  private class_getter udp_server = UDPServer.new
  private class_getter tcp_server = TCPServer.new
  property

  def initialize_tcp_server(object = self)
    initialize_listen(object, tcp_server)
    sleep
  end

  def initialize_udp_server(object = self)
    initialize_listen(object, udp_server)
    sleep
  end

  def receive_udp(request)
  end

  def receive_tcp(request)
  end

  def receive_before(request)
  end

  def receive_after(request)
    message = "After From '#{request.socket_address}', Message: '#{request.message}'"
    request.send(message)
  end

  private def initialize_listen(object, server)
    spawn do
      server.listen do |request|
        object.receive_before(request)
        if server.is_a?(UDPServer)
          object.receive_udp(request)
        elsif server.is_a?(TCPServer)
          object.receive_tcp(request)
        end
        object.receive_after(request)
      end
    end
  end
end
