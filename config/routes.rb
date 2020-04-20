Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :lists

  root 'index#index'

  get '/main/main', to: 'main#main'

  get '/list/new', to: 'list#new'
  get '/list/create', to: 'list#create'
  post '/list/create', to: 'list#create'

end
