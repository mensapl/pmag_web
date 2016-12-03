module API
  module V1
    class Test < Grape::API
      resource :test do
        desc 'Hello from authorizedAPI'
        get do
          'Hello from authorizedAPI!'
        end
      end
    end
  end
end
