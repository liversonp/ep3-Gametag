Rails.application.routes.draw do
  root :to => 'homes#index'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :comments

  get "about" => "about#about"
  resources :posts
  resources :homes do
    member do
      put "like" => "homes#vote"
    end
    resources :comments
  end
  devise_for :users

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
