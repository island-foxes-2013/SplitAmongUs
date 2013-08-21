SplitAmongUs::Application.routes.draw do
  devise_for :users, :controllers => { :invitations => 'users/invitations' }
  resources :users, only: [] do
    resources :bills, only: [:index]
  end
  match 'users/:id' => 'users#show', as: :users
  resources :dashboard, only: [:index]

  resources :lists do
    resources :bills, only: [:show, :create, :edit, :update, :destroy]
    resources :settlements, only: [:new, :create]
  end

  authenticated :user do
    root :to => "dashboard#index"
  end

  root :to => "home#index"
end
