Rails.application.routes.draw do
  resources :patients
  resources :therapists do
    resources :appointments
  end
  resources :appointments

  root 'sessions#home'
  
  get '/signup', to: 'therapists#new'
  post '/signup', to: 'therapists#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  delete '/logout', to: 'sessions#destroy'

  get '/auth/:provider/callback', to: 'sessions#omniauth'
  # resources :notes
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
