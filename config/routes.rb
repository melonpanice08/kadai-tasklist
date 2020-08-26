Rails.application.routes.draw do
  root to: 'tasks#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  resources :users, only: [:new, :create]
  resources:tasks
  

  
  #get 'tasks/index'
  #get 'tasks/show'
  #get 'tasks/new'
  #get 'tasks/edit'
  #get 'toppages/index'
  #get 'sessions/new'
  #get 'sessions/create'
  #get 'sessions/destroy'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end