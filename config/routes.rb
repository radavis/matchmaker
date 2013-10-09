Matchmaker::Application.routes.draw do
  devise_for :users

  resources :users do
    resources :skills
  end

  resources :companies do
    resources :skills
  end

  root to: "users#index"
end
