Rails.application.routes.draw do
  devise_for :users
  get '/' => 'homes#top'
  resources :users, only: [:show, :edit, :update, :index] do
    resource :relationships, only: [:create, :destroy]
  end

  resources :movies, only: [:new, :show, :edit, :update, :index] do
    resources :movie_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end

  get "search" => "searches#search"

end
