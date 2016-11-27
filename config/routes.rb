Rails.application.routes.draw do
  root to: 'static_pages#home'
  
  get "/oauth/connect"  , to: 'sessions#connect' 
  get "/oauth/callback"  , to: 'sessions#callback'
  delete 'logout', to: 'sessions#destroy'
  

  resources :users
  
end