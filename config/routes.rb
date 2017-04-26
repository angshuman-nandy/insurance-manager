Rails.application.routes.draw do
  get 'dash/admin'
  get 'dash/customer'
  get 'policies/select_company'
  get 'policies/select_plan'
  get 'details/make_admin'
  resources :details
  resources :poltypes
  resources :companies
  resources :policies

  root to: 'home#index'

  devise_for :users, controllers: { registrations: "registrations" }

end
