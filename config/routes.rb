Rails.application.routes.draw do
  root to: "homes#top"
  devise_for :users
  resources :books, only: [:index, :show, :update, :edit, :create, :destroy]
  resources :users, only: [:index, :show, :update, :edit]
  get 'home/about' => 'homes#about', as: 'about'
end
