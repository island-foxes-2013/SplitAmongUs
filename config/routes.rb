SplitAmongUs::Application.routes.draw do
  devise_for :users
  resources :dashboard, only: [:index]
  resources :lists, only: [:show, :new, :create]

  root :to => "home#index"
end
