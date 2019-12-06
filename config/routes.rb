Rails.application.routes.draw do
  resources :reviews, only: [:new, :create, :edit, :update]
  resources :books, only: [:index, :show, :create]
  resources :goals, only: [:index, :new, :create, :destroy]
  resources :authors, only: [:index, :show]
  resources :readers
  get '/', to: 'application#home', as: 'home'
  patch '/goals/:id', to: 'goals#update_status', as: "update_status"
  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  # delete '/logout', to: 'sessions#logout', as: 'logout'
  get '/logout', to: 'sessions#logout', as: 'logout'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
