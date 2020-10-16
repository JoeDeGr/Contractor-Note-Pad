Rails.application.routes.draw do
  resources :users do
    resources :workers, only: [:show, :edit]
    resources :projects, only: [:show, :edit]
  end
  resources :workers
  resources :materials
  resources :tasks
  resources :punch_lists
  resources :projects
  resources :sessions
  
  root 'sessions#index'

  get '/auth/facebook/callback' => 'sessions#o_auth'

  post 'workers/:id', to: 'workers#update'
  post 'workers/:id/remove_task', to: 'workers#remove_task'
  post 'tasks/:id/remove_worker', to: 'tasks#remove_worker'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
