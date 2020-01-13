Rails.application.routes.draw do
  
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  root to: 'tasks#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  resources :users, only: [:new, :create]
  
  get 'delete', to: 'tasks#destroy'
  resources :tasks 
end
