module DobambamNotifications
  module API
    module Helpers
      module Authentication
        extend Grape::API::Helpers

        def warden
          env['warden']
        end

        def authenticated
          params[:auth_token] && @user = User.find_by_authentication_token(params[:auth_token])
        end

        def current_user
          warden.user || @user
        end
      end
    end
  end
end
