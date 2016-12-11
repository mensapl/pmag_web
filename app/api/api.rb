require 'grape-swagger'

class API < Grape::API
  helpers Pmag::AuthHelpers

  mount Pmag::AuthorizedAPI
  mount Pmag::PublicTestAPI

  add_swagger_documentation(
    api_version: 'v1',
    hide_documentation_path: true,
    mount_path: '/api/v1/documentation',
    hide_format: true
  )
end
