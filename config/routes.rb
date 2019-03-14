  Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }

  root to: 'pages#home'
  get '/my_posts', to: 'feeds#user_index'
  resources :posts, only: [] do
    resources :comments, only: :create
  end
  resources :feeds, path: :feed, only: [:index]
  resources :tasks, only: [:new, :create, :show, :index, :update]
  resources :questions, only: [:new, :create, :show, :index]

  patch "/users/:id/upvotes", to: "upvotes#update", as: :user_upvote

  resources :events, only: [:new, :create, :show, :index] do
    resources :attendances, only: [:create]
  end

  resources :attendances, only: [:destroy]
  resources :notifications, only: [:update]

end
