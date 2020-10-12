Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'home/index'

  root 'home#index'
  resources :hollas, only: :show
  resources :users, path: :terps do
    resources :hollas
  end
  devise_for :users
end
