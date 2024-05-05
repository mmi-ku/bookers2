Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  get 'about', to: 'homes#about', as: 'about'
  get 'user/show'
  get 'user/edit'
  get 'user/view'

  resources :books, only: [:new, :index, :show]
  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
