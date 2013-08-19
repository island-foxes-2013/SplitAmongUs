SplitAmongUs::Application.routes.draw do
  devise_for :users, :controllers => { :invitations => 'users/invitations' }
  resources :users, only: [] do
    resources :bills, only: [:index]
  end
  match 'users/:id' => 'users#show', as: :users
  resources :dashboard, only: [:index]

  resources :lists, only: [:show, :new, :create] do # will need edit update delete and destroy
    resources :bills, only: [:show, :create, :edit, :update] # will need edit update delete and destroy
  end
  
  resources :lists, only: [:edit, :update, :destroy]

  root :to => "home#index"

  authenticated :user do
    root :to => "dashboard#index"
  end
end
