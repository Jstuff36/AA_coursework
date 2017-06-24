Links::Application.routes.draw do
  get 'links/new'

  get 'links/create'

  resources :users
  resources :links
  resources :comments 
  resource :session
end
