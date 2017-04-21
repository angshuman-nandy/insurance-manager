Rails.application.routes.draw do
  get 'dash/admin'
  get 'dash/customer'
  resources :details
  resources :poltypes
  resources :companies

  root to: 'home#index'

  devise_for :users, controllers: { registrations: "registrations" }

end
