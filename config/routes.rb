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
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
