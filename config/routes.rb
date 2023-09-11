Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: 'properties#index'
  resources :properties

  namespace :profile do
    resources :properties do
      put 'change_status', on: :member
    end
  end
end
