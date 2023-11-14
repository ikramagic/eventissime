Rails.application.routes.draw do

  namespace :admin do
      resources :attendances
      resources :events
      resources :users

      root to: "attendances#index"
    end

  root 'events#index'
  
  devise_for :users

  resources :attendances

  resources :static_pages


  resources :events do
    resources :illustration, only: [:create]

    member do
      get 'payment', to: 'events#show'
      get 'payment_success', to: 'events#payment_success'
    end
  end

  resources :users, only: [:show] do
    resources :avatars, only: [:create]
  end
end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

    #Defines the root path route ("/")
    #root "articles#index"

    #scope '/checkout' do
    #post 'create', to: 'checkout#create', as: 'checkout_create'
    #get 'success', to: 'checkout#success', as: 'checkout_success'
    #get 'cancel', to: 'checkout#cancel', as: 'checkout_cancel'
    #end