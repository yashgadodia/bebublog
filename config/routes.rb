Rails.application.routes.draw do
  get 'about', to: "pages#about" #get about to pages controller about action

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
