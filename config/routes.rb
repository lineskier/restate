Rails.application.routes.draw do


  get 'users/dashboard'
  get 'estate/buy'
  devise_for :models
  devise_for :users
  resources :estates

  get 'static_pages/home'
  get 'static_pages/help'
  root 'estates#index'
  get 'estates/rezerwuj'

  resources :estates do
  	member do 
  		put :toggle_status
  	end
  end


end
