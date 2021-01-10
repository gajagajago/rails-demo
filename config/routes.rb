Rails.application.routes.draw do
  root 'pages#home'

  get 'about', to: 'pages#about'
  # get 'chatrooms', to: 'chatroom#index'

  resources :users
  resources :articles
  resources :categories, except: [:destroy]
  resources :comments
  resources :chatrooms, only: [:index, :show]
  resources :messages, only: [:new, :create]

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  mount ActionCable.server, at: '/cable'
end
