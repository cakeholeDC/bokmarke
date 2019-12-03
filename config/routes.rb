Rails.application.routes.draw do
  resources :books, only: [:index, :show]
  resources :goals, only: [:index, :new, :create]
  resources :authors, only: [:index, :show]
  resources :readers
  get '/', to: 'application#home', as: 'home'
  patch '/goals/:goal_id', to: 'goals#update_status', as: "update_status"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
