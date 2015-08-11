Rails.application.routes.draw do


  root 'pages#index'
  
  resources :pages
  resources :users, except:[:new]
  resources :sessions, only:[:create]

  get '/', 	to: 'pages#index'
  get '/random' , to: 'pages#random'
  get '/about', to: 'pages#about'

  get '/signup', 			to: 'users#new'
  get '/signin', 			to: 'sessions#new'
  delete '/signout', 	to: 'sessions#destroy'



end
