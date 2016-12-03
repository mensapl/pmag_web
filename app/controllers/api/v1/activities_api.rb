module API
  module V1
    class ActivitiesAPI < Grape::API
      resource :activities do
        desc 'Returns list of accepted activities'
        get do
          Activity.all.where(accepted: true)
        end

        desc 'Creates a new activity'
        params do
          optional :title
          optional :description
          optional :start_time, type: Time, coerce_with: ->(val) { Time.parse(val) }
          optional :end_time, type: Time, coerce_with: ->(val) { Time.parse(val) }
        end
        post do
          result = Activity::Create.call(current_user, declared_params)
          error!(result.value, 422) unless result.success?
          result.value
        end

        route_param :id do
          get do
            Activity.find_by(id: params[:id])
          end
        end
      end
    end
  end
end
