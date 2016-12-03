require 'doorkeeper/grape/helpers'

module API  
  module V1
    class AuthorizedAPI < Grape::API
      helpers AuthHelpers
      include API::V1::Defaults
      helpers Doorkeeper::Grape::Helpers
      before { doorkeeper_authorize! }
      mount API::V1::Test
      mount API::V1::ActivitiesAPI
    end
  end
end
