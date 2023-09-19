Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do
    namespace :v0 do
      resources :search, only: [:index]
      resources :provider_details, only: [:show]
      resources :providers, only: [:new, :create, :show, :update, :destroy]
    end
  end
end
