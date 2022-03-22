Rails.application.routes.draw do
  devise_for :customers, path: "customers"
  root "landing_pages#show"

  resource :landing_page, only: [:show]
end
