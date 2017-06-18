Rails.application.routes.draw do
  get 'users/index'
  devise_for :users
  resources :users
  root :to => "users#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
  	namespace :v1 do
      resources :users, only: [:index]
    end
  end
end
