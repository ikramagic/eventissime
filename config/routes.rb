Rails.application.routes.draw do
  devise_for :users
  resources :attendances
  resources :events
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  #resources :users
  root 'events#index'

  devise_scope :user do
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end
end