Rails.application.routes.draw do
  resources :programs do
    resources :workouts  
  end

  resources :workouts
end
