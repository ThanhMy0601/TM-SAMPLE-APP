Rails.application.routes.draw do
  root 'sample_app#home'
  get '/help', to: 'sample_app#help'
  get '/about', to: 'sample_app#about'
  get '/contact', to: 'sample_app#contact'
  get '/signup', to: 'users#new'
  # get '/edit-profile', to: 'users#edit'
  # post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :microposts, only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
