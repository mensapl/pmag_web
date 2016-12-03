require 'doorkeeper/grape/helpers'
module API
  module V1
    module AuthHelpers
      extend Grape::API::Helpers
      include Doorkeeper::Grape::Helpers

      def current_user
        User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
      end
    end
  end
end
