Wackypedia::Application.routes.draw do
  resources :services

  resources :articles, only: %i[new create show]
  root 'encyclopedia#index'
end
