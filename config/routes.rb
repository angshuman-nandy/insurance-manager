Rails.application.routes.draw do
   get 'dash/admin'
  get 'dash/customer'
  get 'dash/policy_handle'
  get 'dash/user_handle'
  get 'dash/poltype_handle'
  get 'dash/company_handle'
  get 'policies/select_company'
  get 'policies/select_plan'
  get 'details/make_admin'
  get 'details/cedit'
  get 'details/cdestroy'
  get 'details/cshow'
  get 'details/cupdate'
  resources :details
  resources :poltypes
  resources :companies
  resources :policies
  resources :posts
  root to: "home#index"
  devise_for :users, controllers: { registrations: "registrations" }

end
