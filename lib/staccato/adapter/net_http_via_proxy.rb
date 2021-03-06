require 'net/http'

module Staccato
  module Adapter
    class NetHttpViaProxy

      def initialize(uri, proxy_host, proxy_port)
        @uri = uri
        @proxy_host = proxy_host
        @proxy_port = proxy_port
      end

      def post(params)
        ::Net::HTTP::Proxy(@proxy_host, @proxy_port).post_form @uri, params
      end

      def post_body(data)
        ::Net::HTTP::Proxy(@proxy_host, @proxy_port).post(@uri, data)
      end
    end
  end
end
