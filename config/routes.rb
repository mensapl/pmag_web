Rails.application.routes.draw do
  mount API, at: "/"
  get 'home/index'

  root to: 'home#index'

  use_doorkeeper
  devise_for :users, skip: [:registrations]
  mount GrapeSwaggerRails::Engine => '/swagger'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
