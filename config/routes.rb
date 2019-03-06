Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :profiles, only: [ :index, :new, :create, :show, :edit, :update ] do
    resources :categories, only: [ :new, :create, :show] 
    resources :weightings, only: [ :new, :create ]
    resources :categories, only: [ :new, :create, :show ]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
