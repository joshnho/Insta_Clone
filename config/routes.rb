Rails.application.routes.draw do
  resources :likes
  resources :posts
  resources :users do
    resources :posts
  end
  get '/', to: 'users#index', as: 'homepage'

  get '/signup' => 'users#new'
  post '/users'=> 'users#create'
  get '/signin' => 'login#new'
  post '/signin' => 'login#create' 
  get '/logout' => 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end


