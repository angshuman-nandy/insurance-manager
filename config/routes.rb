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
  get 'details/display'
  get 'policies/display'
  get 'companies/companyShow'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users
  resources :details
  resources :poltypes
  resources :companies
  resources :policies
  resources :posts
  resources :comments
  root to: "sessions#new"

end
