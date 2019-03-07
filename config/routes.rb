Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :feeds, path: :feed, only: [:index]
  resources :tasks, only: [:new, :create, :show, :index]
  resources :questions, only: [:new, :create, :show, :index]
  resources :events, only: [:new, :create, :show, :index]
end
