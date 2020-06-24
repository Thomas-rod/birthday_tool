Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'onboarding/', to: "pages#onboarding", as: :onboarding
  # post 'onboarding/', to: "pages#onboarding", as: :onboarding
  resources :friends, only: [:index, :create, :new];

  resources :profils, only: [:create];
end
