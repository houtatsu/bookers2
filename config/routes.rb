Rails.application.routes.draw do
  root to: "homes#top"
  devise_for :users
  resources :books, only: [:new, :index, :show, :edit]
  resources :users, only: [:show, :edit]
  get  '/about', to: 'homes#about', as: 'about'
end
