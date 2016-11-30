Rails.application.routes.draw do
  resources :trains do
    resources :vagons, shallow: true
  end

  resources :routes
  
  resources :railway_stations do 
    patch :update_position, on: :member
  end

  resource :search, only: [:new, :show, :edit]
     
  get 'welcome/index'

  root 'welcome#index'

end
