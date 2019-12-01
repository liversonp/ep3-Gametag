Rails.application.routes.draw do
  resources :comments
  
  get "about" => "about#about"
  resources :posts
  resources :homes
  devise_for :users

  root :to => 'homes#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
