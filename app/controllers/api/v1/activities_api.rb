module API  
  module V1
    class ActivitiesAPI < Grape::API
      resource :activities do
        desc 'Returns list of accepted activities'
        get do
          Activity.all.where(accepted: true)
        end
      end
    end
  end
end
