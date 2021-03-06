Rails.application.routes.draw do
  root "web#index"
  get "/about", to: "web#index"
  get "/contact", to: "web#index"
  get "/now", to: "web#index"

  get "/posts", to: "web#index"
  get "/search/:id", to: "web#index"

  get "/places", to: "web#index"
  get "/places/:id", to: "web#index"
  get "/places/:id/edit", to: "web#index"
  get "/places/new", to: "web#index"
  get "/places/:id/posts/:post_id", to: "web#index"
  get "/places/:id/posts/:post_id/edit", to: "web#index"
  get "/places/:id/posts/new", to: "web#index"

  get "/hashtags/:id", to: "web#index"

  get "/sign_up", to: "web#index"
  get "/sign_in", to: "web#index"

  get "/users/mypages", to: "web#index"
  get "/users/mypages/edit", to: "web#index"
  get "/users/feed", to: "web#index"
  get "/users/:id", to: "web#index"

  devise_for :users
  namespace :api, format: 'json' do
    resources :posts
    post '/posts/search' => 'posts#search'
    post '/posts/pagenation' => 'posts#pagenation'
    post '/posts/hashtags' => 'posts#hashtags'
    post '/posts/search/hashtags' => 'posts#search_hashtags'
    post '/posts/count' => 'posts#count'

    get '/places/count' => 'places#count'
    resources :places
    post '/places/search' => 'places#search'
    post '/places/pagenation' => 'places#pagenation'
    post '/places/hashtags' => 'places#hashtags'
    post '/places/search/hashtags' => 'places#search_hashtags'
    post '/places/location' => 'places#location'
    post '/places/follow' => 'places#follow'
    post '/places/followed' => 'places#followed'
    post '/places/now' => 'places#now'

    put '/users' => 'users#update'
    get '/users/sessions' => 'users#user_session'
    get '/users/feed' => 'users#feed'
    get '/users/:id' => 'users#show'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
