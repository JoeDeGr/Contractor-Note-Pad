Rails.application.routes.draw do
  resources :users do
    resources :workers, only: [:show, :edit, :new]
    resources :projects, only: [:show, :edit]
  end
  resources :workers
  resources :projects

  resources :materials, :tasks, :punch_lists,:sessions
  
  root 'sessions#index'

  get 'search_tasks_for_workers', to: 'users#search_workers'
  get '/auth/facebook/callback', to: 'sessions#o_auth'
  post 'workers/:id', to: 'workers#update'
  post 'workers/:id/remove_task', to: 'workers#remove_task'
  post 'tasks/:id/remove_worker', to: 'tasks#remove_worker'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
