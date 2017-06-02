Rails.application.routes.draw do
  resources :posts
  namespace :admin do
    resources :users
    root to: "users#index"
  end
  root to: 'visitors#index'
  devise_for :users
  resources :users

  get "/pages/*id" => 'pages#show', as: :page, format: false

end
