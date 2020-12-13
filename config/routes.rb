Rails.application.routes.draw do
  root 'pages#home'

  get 'about', to: 'pages#about'

  resources :users
  resources :articles

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
