Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'homes#top'
  devise_for :users

  resources :users, only: [:new, :index, :show]
end
