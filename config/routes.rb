Rails.application.routes.draw do
  resources :collaborations
  namespace :api do
    namespace :v1 do
      resources :media_items
      resources :users
      resources :resumes
      resources :work_experiences

      get '/current_user', to: 'auth#show'
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
    end
  end
end
