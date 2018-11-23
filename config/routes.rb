Rails.application.routes.draw do
  root "web#index"
  get "/about", to: "web#index"
  get "/contact", to: "web#index"

  get "/posts", to: "web#index"
  get "/posts/:id", to: "web#index"
  get "/posts/:id/edit", to: "web#index"
  get "/posts/new", to: "web#index"
  get "/search/:id", to: "web#index"

  devise_for :users
  namespace :api, format: 'json' do
    resources :posts
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
