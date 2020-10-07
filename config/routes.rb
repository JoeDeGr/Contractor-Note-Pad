Rails.application.routes.draw do
  resources :workers
  resources :materials
  resources :tasks
  resources :punch_lists
  resources :projects
  resources :sessions
  resources :users
  root 'sessions#index'
  
  # get 'sessions/new'
  # get 'sessions/create'
  # get 'sessions/destroy'

  post 'workers/:id', to: 'workers#update'
  post 'workers/:id/remove_task', to: 'workers#remove_task'
  post 'tasks/:id/remove_worker', to: 'tasks#remove_worker'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
