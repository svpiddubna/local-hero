Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :feeds, only: [:index, :show]
  resources :tasks, only: [:new, :create, :show]
  resources :questions, only: [:new, :create, :show]
  resources :events, only: [:new, :create, :show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
