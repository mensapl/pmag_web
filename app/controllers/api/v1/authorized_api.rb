require 'doorkeeper/grape/helpers'

module API  
  module V1
    class AuthorizedAPI < Grape::API
      helpers Doorkeeper::Grape::Helpers
      include API::V1::Defaults
      before { doorkeeper_authorize! }
      mount API::V1::Test
    end
  end
end
