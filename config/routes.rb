Rails.application.routes.draw do
  devise_for :users
  resources :customers, only: [:show]
  resources :staffs, only: [:show]
  resource :landing_page, only: [:show]

  root "landing_pages#show"
end
