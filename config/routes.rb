Rails.application.routes.draw do
  devise_for :users,
    controllers: { omniauth_callbacks: 'callback' }

  root to: 'pages#home'
  resources :profiles, only: [ :index, :new, :create, :show, :edit, :update ]
  resources :categories, only: [ :new, :create, :show] 
  resources :weightings, only: [ :new, :create ]
  resources :technicals, only: [ :new, :create, :show ]

  get '/location', to: 'pages#location', as: 'location'
  patch '/choose-pictures', to: 'pages#choose_pictures', as: 'choose_pictures'
  get '/select-goals', to: 'pages#select_goals', as: 'select_goals'
  patch '/select-w', to: 'pages#select_w', as: 'select_w'
  


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end