Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :feeds, path: :feed, only: [:index]
  resources :tasks, only: [:new, :create, :show]
  resources :questions, only: [:new, :create, :show]
  resources :events, only: [:new, :create, :show]
end
