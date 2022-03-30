Rails.application.routes.draw do
  devise_for :customers, path: "customers"

  unauthenticated do
    root "landing_pages#show"
  end

  authenticated :customer do
    root "customers/homes#show", as: :customer_root
  end

  resource :landing_page, only: [:show]

  resources :customers, only: [], module: :customers do
    resource :homes, only: [:show]
  end
end
