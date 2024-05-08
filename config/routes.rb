Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  get 'about', to: 'homes#about', as: 'about'
  

  resources :books, only: [:index, :show, :edit, :update, :create, :destroy]
  resources :users, only: [:show, :edit, :view, :update]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
