SplitAmongUs::Application.routes.draw do
  devise_for :users
  match 'users/:id' => 'users#show', as: :users
  resources :dashboard, only: [:index]
 
  # will need edit update delete and destroy
  resources :lists, only: [:show, :new, :create] do 
    resources :bills, only: [:show, :create, :edit, :update]
  end
  
  root :to => "home#index"
end
