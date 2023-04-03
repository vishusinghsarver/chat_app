Rails.application.routes.draw do
  # get 'messages/index'
  patch 'messages/id', to: "messages#create", as: 'messages_create'
  devise_for :users
  # resources :conversations, only: [:create]
  
  # get '/change'
  # get 'admins/invite'
  # post 'conversations/create'
  #  post 'conversations/create', to: 'conversations#create', as: 'conversations_path'
  post 'users/id', to: "messages#index", as: 'messages_index'
   #get 'users/index'
  # get 'users/edit'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users
  # Defines the root path route ("/")
  root "users#list"
  mount ActionCable.server => '/cable'
end
