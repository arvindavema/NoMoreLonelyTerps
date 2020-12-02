Rails.application.routes.draw do
  get 'explore/index'
  devise_for :users
  root controller: :home, action: :index

  get 'chat', to: 'chat#index', as: 'chat'
  get 'market', to: 'market#index', as: 'market'
  get 'explore', to: 'explore#index', as: 'explore'
  get 'terps/:user_id/send_request', to: 'users#send_request'
  resources :rooms
  resources :room_msgs
  resources :comments do
    resources :comments
  end
  resources :hollas do
    resources :comments do
      resources :comments
    end
    member do
      patch :like
      put :like
    end
  end

  resources :users, path: :terps do
    resources :comments do
       resources :comments
    end

    member do
      put :send_request
      patch :block_friend
      patch :unblock_friend
    end

    resources :room_msgs
    resources :hollas
    resources :comments
  end

end
