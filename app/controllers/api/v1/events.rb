module API  
  module V1
    class Events < Grape::API
      include API::V1::Defaults

      resource :events do
        desc "Return all events"
        get do
          'Hello!'
        end
      end
    end
  end
end
