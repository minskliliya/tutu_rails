Rails.application.routes.draw do
  devise_for :users

  resources :tickets do
    post :buy, on: :member
  end  
  
  namespace :admin do
    resources :railway_stations do 
      patch :update_position, on: :member
      patch :arrival_time, on: :member
      patch :departure_time, on: :member
    end
      
    resources :trains do
      resources :vagons, shallow: true
    end

    resources :routes
    resources :tickets 
  end

  resource :search, only: [:new, :show, :create, :edit]
     
  get 'welcome/index'

  root 'searches#show'

end
