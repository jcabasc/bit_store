Rails.application.routes.draw do
  resources :clients
  resources :products
  resources :headquarters
  resources :purchases
  resources :logs, only: [:index]

  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      resources :clients
      resources :products
      resources :headquarters
      resources :purchases
      resources :logs, only: [:index]
    end
  end
end
