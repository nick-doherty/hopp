HoppApp::Application.routes.draw do
  root :to => 'pages#home'

  get '/user/login' => 'session#new'
  post '/user/login' => 'session#create'
  delete '/user/login' => 'session#destroy'


  resources :users, :except => [:edit] do
    collection do
      get 'edit'
    end
  end

end
