Rails.application.routes.draw do
  root "static_pages#root"

  namespace :api, defaults: { format: :json } do
    resources :user, only: [:create]
    resources :session, only: [:create, :destroy]
  end
end
