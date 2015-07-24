Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/library' => 'libraries#show'
      get '/movies' => 'movies#index'
      post '/movies' => 'movies#create'

      get '/seasons' => 'seasons#index'
      post '/seasons' => 'seasons#create'

      get '/content' => 'all#index'
    end
  end
end
