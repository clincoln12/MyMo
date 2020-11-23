Rails.application.routes.draw do
  resources :payments
  root 'sessions#home'

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  delete '/logout' => 'sessions#destroy'

  resources :subscriptions
  resources :services
  resources :users do
    resources :subscriptions, only: [:new, :create, :index]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
