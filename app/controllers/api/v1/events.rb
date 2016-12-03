module API  
  module V1
    class Events < Grape::API
      resource :events do
        desc "Return all events"
        get do
          'Hello!'
        end
      end
    end
  end
end
