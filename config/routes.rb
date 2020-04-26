Rails.application.routes.draw do
  devise_for :users
  root 'pages#about'
  get 'about', to: "pages#about" #get about to pages controller about action
  
  # resources :posts
  # get '/blog', to: 'posts#index'
  # devise_for :users
  # root 'posts#index'
  # get 'about', to: 'pages#about'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
