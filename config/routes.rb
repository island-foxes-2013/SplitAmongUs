SplitAmongUs::Application.routes.draw do
  devise_for :users

  root :to => "shared#index"
end
