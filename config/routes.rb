Rails.application.routes.draw do
  get 'friends/index'
  get 'friends/create'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :friends, only: [:index];
end
