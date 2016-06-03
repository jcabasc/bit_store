Rails.application.routes.draw do
  root to: 'clients#index'
  resources :clients
  resources :products
  resources :headquarters
  resources :purchases
  resources :logs, only: [:index]
  resource :weekly_report, only: [:create]
  resource :export, only: [:create]

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
