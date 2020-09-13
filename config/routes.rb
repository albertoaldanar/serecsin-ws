Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api, defautls: {format: :json} do
    namespace :v1 do
      get '/users' => 'users#all_users'
      get '/login' => 'users#login'
      post '/create_user' => 'users#create_user'
      # post '/create_route' => 'route#create_route'
      # post '/payments' => 'users#add_card'
      # get '/listings' => 'rooms#your_listings'
      # get '/users' => 'users#all_users'
      # post '/create_movie' => 'movies#create'
      # get '/movies' => 'movies#all_movies'
      # post '/edit_movie' => 'movies#edit_movie'

      # resources :rooms do
      #   member do
      #     get '/reservations' => 'reservations#reservations_by_room'
      #   end
      # end
      # resources :reservations do
      #   member do
      #     post '/approve' => 'reservations#approve'
      #     post '/decline' => 'reservations#decline'
      #   end
      # end
    end
  end
end
