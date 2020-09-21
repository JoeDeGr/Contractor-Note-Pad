Rails.application.routes.draw do
  resources :workers
  resources :materials
  resources :tasks
  resources :punch_lists
  resources :projects
  root 'sessions#index'
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  resources :users
  post 'workers/:id', to: 'workers#update'
  post 'workers/:id/remove_task', to: 'workers#remove_task'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
