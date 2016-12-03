require 'doorkeeper/grape/helpers'

module API  
  module V1
    class AuthorizedAPI < Grape::API
      include API::V1::Defaults
      helpers Doorkeeper::Grape::Helpers
      before { doorkeeper_authorize! }
      mount API::V1::Test
    end
  end
end
