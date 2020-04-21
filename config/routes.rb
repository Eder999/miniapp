Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'index#index'

  get '/main/main', to: 'main#main'

  get '/lists/create', to: 'lists#create'
  post '/lists/create', to: 'lists#create'
  resources :lists

  get '/tasks/create', to: 'tasks#create'
  post '/tasks/create', to: 'tasks#create'
  get '/tasks/close', to: 'tasks#close'
  resources :tasks

  get '/user/favorite_list', to: 'user#favorite_list'
  resources :user

end
