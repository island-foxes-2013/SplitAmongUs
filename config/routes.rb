SplitAmongUs::Application.routes.draw do
  devise_for :users
  match 'users/:id' => 'users#show'
  resources :dashboard, only: [:index]
  resources :lists, only: [:show, :create]

  root :to => "home#index"
end
