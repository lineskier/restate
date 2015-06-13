Rails.application.routes.draw do


  get 'users/dashboard'

  devise_for :models
  devise_for :users
  resources :estates

  get 'static_pages/home'
  get 'static_pages/help'
  root 'estates#index'
  


end
