Rails.application.routes.draw do

  root 'programs#index'
  resources :programs do
    resources :cycles do
      resources :workouts  
    end
  end

  resources :workouts

  resources :cycles
end
