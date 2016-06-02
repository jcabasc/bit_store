Rails.application.routes.draw do
  resources :clients
  resources :products
  resources :headquarters
  resources :purchases

  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      resources :clients
      resources :products
      resources :headquarters
      resources :purchases
    end
  end
end
