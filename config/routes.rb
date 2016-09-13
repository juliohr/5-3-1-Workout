Rails.application.routes.draw do

  root 'programs#index'
  get 'signup' => 'users#new'

  resources :programs do
    resources :cycles do
      resources :workouts  
    end
  end
  resources :workouts
  resources :cycles
  resources :users
end
