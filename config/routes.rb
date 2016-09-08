Rails.application.routes.draw do
  resources :programs do
    resources :cycles do
      resources :workouts  
    end
  end

  resources :workouts
end
