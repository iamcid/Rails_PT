Rails.application.routes.draw do

  root 'sessions#home'
  
  get '/signup', to: 'therapists#new'
  post '/signup', to: 'therapists#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  delete '/logout', to: 'sessions#destroy'
  # resources :notes
  resources :patients
  resources :appointments
  resources :therapists
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
