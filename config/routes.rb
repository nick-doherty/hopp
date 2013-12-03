HoppApp::Application.routes.draw do
  root :to => 'pages#home'

  get '/home' => 'pages#home2'
  get '/user/login' => 'session#new'
  post '/user/login' => 'session#create'
  delete '/user/login' => 'session#destroy', :as => 'logout'
  get '/begin' => 'pages#begin'
  get '/end' => 'pages#end'
  get '/bookmarks' => 'bookmarks#show'
  post '/bookmarks' => 'bookmarks#create'
  get '/about' => 'pages#about'
  get '/contact' => 'pages#contact'

  resources :users, :except => [:edit] do
    collection do
      get 'edit'
    end
  end

  resources :interests, :except => [:show, :edit] do
    collection do
      get 'edit'
    end
  end

  resources :content

end
