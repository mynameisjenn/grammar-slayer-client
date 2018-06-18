Rails.application.routes.draw do

  get "/signup" => "users#new"
  get "/users" => "users#index"
  post "/users" => "users#create"
  get '/users/:id' => 'users#show'
  post '/users/:id' => 'user#update'
 

  namespace :client do
    get '/words' => 'words#index'
    get '/words/:id' => 'words#show'
    post '/words' => 'words#create'
    patch '/words/:id' => 'words#update'
    delete '/words/:id' => 'words#destroy' 
    
    get '/game_plays' => 'game_plays#index'
    get '/game_plays/:id' => 'game_plays#show'
    
  end
end
