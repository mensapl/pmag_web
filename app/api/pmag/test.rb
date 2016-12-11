module Pmag
  class Test < Grape::API
    resource :test do
      desc 'Hello from authorizedAPI'
      get do
        'Hello from authorizedAPI!'
      end
    end
  end
end
