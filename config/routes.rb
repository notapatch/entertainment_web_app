Rails.application.routes.draw do
  devise_for :users
  resource :landing_page, only: [:show]

  root "landing_pages#show"
end
