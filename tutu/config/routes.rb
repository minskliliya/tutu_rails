Rails.application.routes.draw do
  resources :trains do
    resources :vagons, shallow: true
  end

  resources :routes
  
  resources :tickets 
  
  resources :railway_stations do 
    patch :update_position, on: :member
    patch :arrival_time, on: :member
    patch :departure_time, on: :member
  end

  resource :search, only: [:show, :create]
     
  get 'welcome/index'

  root 'welcome#index'

end
