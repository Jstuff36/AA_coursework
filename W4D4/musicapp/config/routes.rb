Rails.application.routes.draw do
  resources :users
  resource :sessions #should be session but dont want to go back and change everything
  resources :bands do
    resources :album, only: [:new]
  end

  resources :album, only: [:create, :edit, :show, :update, :destroy] do
    resources :tracks, only: [:new]
  end

  resources :tracks, only: [:create, :edit, :show, :update, :destroy]

end
