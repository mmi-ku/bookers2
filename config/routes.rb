Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  get 'about', to: 'homes#about', as: 'about'
  

  resources :books, only: [:index, :show, :edit, :update, :create, :destroy]
  resources :users, only: [:show, :edit, :view, :update, :index]
  
end
