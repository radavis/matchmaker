Matchmaker::Application.routes.draw do
  devise_for :users
  resources :users
  resources :companies do
    resources :ratings
  end
  resources :profiles
  root to: "users#index"
end
