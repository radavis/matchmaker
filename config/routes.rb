Matchmaker::Application.routes.draw do
  devise_for :users
  resources :users
  resources :companies
  root to: "users#index"
end
