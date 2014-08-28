require 'uri'
require 'net/http'

module DobambamNotifications
  module API
    module Helpers
      module HTTP
        extend Grape::API::Helpers

        def send_post_request(target_uri, _form_data)
          uri = URI(target_uri)
          request = Net::HTTP.new(uri.host, uri.port)
          request.use_ssl = (uri.scheme == 'https')

          request.post(uri.path, uri.query)
        end
      end
    end
  end
end
