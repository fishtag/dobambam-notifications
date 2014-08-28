module DobambamNotifications
  module API
    class Endpoint < Grape::API
      helpers DobambamNotifications::API::Helpers::Authentication
      helpers DobambamNotifications::API::Helpers::HTTP

      before do
        error!('401 Unauthorized', 401) unless authenticated
      end

      format :json
      default_format :json

      rescue_from ActiveRecord::StatementInvalid do
        Rack::Response.new(['404 Not found'], 404).finish
      end

      resource :endpoints do
        desc 'Target DoBamBam dynamic hook to this endpoint'
        get ':id' do
          endpoint = ::Endpoint.find(params[:id])

          present send_post_request(endpoint.repost_url, [])
        end
      end
    end
  end
end
