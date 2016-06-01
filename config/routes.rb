Rails.application.routes.draw do
  resources :clients
  resources :products
  resources :headquarters
  resources :purchases
end
