Rails.application.routes.draw do
  root "web#index"
  get "/about", to: "web#index"
  get "/contact", to: "web#index"

  get "/posts", to: "web#index"
  get "/posts/:id", to: "web#index"
  get "/posts/:id/edit", to: "web#index"
  get "/posts/new", to: "web#index"
  get "/search/:id", to: "web#index"

  get "/places", to: "web#index"
  get "/places/:id", to: "web#index"
  get "/places/:id/edit", to: "web#index"
  get "/places/new", to: "web#index"

  devise_for :users
  namespace :api, format: 'json' do
    resources :posts
    post '/posts/search' => 'posts#search'
    post '/posts/pagenation' => 'posts#pagenation'

    resources :places
    post '/places/search' => 'places#search'
    post '/places/pagenation' => 'places#pagenation'
    post '/places/locatison' => 'places#location'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
