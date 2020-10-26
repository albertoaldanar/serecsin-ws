Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api, defautls: {format: :json} do
    namespace :v1 do
      get '/users' => 'users#all_users'
      post '/login' => 'users#login'
      post '/create_user' => 'users#create_user'
      post '/edit_user' => 'users#edit_user'
      post '/delete_user' => 'users#delete_user'
      post '/create_route' => 'routes#create_route'
      post '/finish_route' => 'routes#finish_route'
      post '/delete_routes' => 'routes#delete_routes'
      post '/create_stop' => 'stops#create_stop'
      post '/get_stops' => 'stops#get_stops'
      post '/all_stops' => 'stops#all_stops'
      post '/delete_stops' => 'stops#delete_stops'
      post '/delete_stop' => 'stops#delete_stop'
      post '/filtered_stops' => 'stops#filtered_stops'
      post '/create_task' => 'tasks#create_task'
      post '/edit_task' => 'tasks#edit_task'
      post '/delete_task' => 'tasks#delete_task'
      post '/delete_tasks' => 'tasks#delete_tasks'
      post '/filtered_tasks' => 'tasks#filtered_tasks'
      post '/create_multiple_tasks' => 'tasks#create_multiple_tasks'
      post '/all_tasks' => 'tasks#all_tasks'
      post '/delete_multiple_tasks' => 'tasks#delete_multiple_tasks'
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
