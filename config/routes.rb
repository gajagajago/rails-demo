Rails.application.routes.draw do
  root 'pages#home'

  get 'about', to: 'pages#about'
  get 'chatroom', to: 'chatroom#index'

  resources :users
  resources :articles
  resources :categories, except: [:destroy]
  resources :comments

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
