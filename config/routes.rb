Rails.application.routes.draw do
  get 'home/index'

  root to: 'home#index'

  use_doorkeeper
  devise_for :users, skip: [:registrations]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
