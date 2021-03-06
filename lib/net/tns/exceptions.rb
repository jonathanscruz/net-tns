module Net::TNS
  module Exceptions
    class TnsException < StandardError
    end

    class ProtocolException < TnsException
    end


    class ReceiveTimeoutExceeded < TnsException
    end

    class ConnectionClosed < TnsException
    end

    class RefuseMessageReceived < TnsException
    end

    class RedirectMessageReceived < TnsException
      attr_reader :new_port
      attr_reader :new_host

      def initialize( message )
        super( message )

        host_matches = /\(HOST=([^\)]+)\)/.match( self.message )
        @new_host = host_matches[1] unless host_matches.nil?

        port_matches = /\(PORT=(\d{1,5})\)/.match( self.message )
        @new_port = port_matches[1] unless port_matches.nil?
      end
    end
  end
end
