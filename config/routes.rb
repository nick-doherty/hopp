HoppApp::Application.routes.draw do
  root :to => 'pages#home'

  get '/user/login' => 'users_session#new'
  post '/user/login' => 'users_session#create'
  delete '/user/login' => 'users_session#destroy'

end
