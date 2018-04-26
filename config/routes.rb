Rails.application.routes.draw do

  post 'auth/register', to: 'session#register'
  post 'auth/login', to: 'session#login'
  get 'test', to: 'session#test'
  get 'auth/logout', to: 'session#logout'
  resources :users
  resources :tenants
  resources :social_networks
  resources :contacts
  resources :addresses
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
