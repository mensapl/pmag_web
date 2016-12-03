module API  
  module V1
    class PublicTestAPI < Grape::API
      include API::V1::Defaults
      resource :public_test do
        desc "Return hello for unauthorized"
        get do
          'Hello from not authorized!'
        end
      end
    end
  end
end
