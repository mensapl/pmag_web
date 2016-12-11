module Pmag
  class PublicTestAPI < Grape::API
    include Pmag::Defaults
    resource :public_test do
      desc 'Return hello for unauthorized'
      get do
        'Hello from not authorized!'
      end
    end
  end
end
