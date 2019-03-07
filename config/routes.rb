Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  authenticated :user do
    root to: 'feeds#index'
  end

  root to: 'pages#home'
  resources :posts, only: [] do
    resources :comments, only: :create
  end
  resources :feeds, path: :feed, only: [:index]
  resources :tasks, only: [:new, :create, :show, :index, :update]
  resources :questions, only: [:new, :create, :show, :index]

  resources :users, only: [] do
    resources :upvotes, only: :update
  end
  resources :events, only: [:new, :create, :show, :index] do
    resources :attendances, only: [:create]
  end

  resources :attendances, only: [:destroy]
end
