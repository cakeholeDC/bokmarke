Rails.application.routes.draw do
  resources :books, only: [:index, :show]
  # resources :goals
  resources :authors, only: [:index, :show]
  resources :readers
  get '/', to: 'application#home', as: 'home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
