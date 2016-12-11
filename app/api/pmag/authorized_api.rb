require 'doorkeeper/grape/helpers'

module Pmag
  class AuthorizedAPI < Grape::API
    include Pmag::Defaults
    helpers Doorkeeper::Grape::Helpers
    before { doorkeeper_authorize! }
    mount Pmag::Test
    mount Pmag::ActivitiesAPI
  end
end
