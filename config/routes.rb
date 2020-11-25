Rails.application.routes.draw do
  devise_for :users
  root controller: :home, action: :index

  get 'chat', to: 'chat#index', as: 'chat'
  get 'market', to: 'market#index', as: 'market'
  
  resources :rooms
  resources :room_msgs

  resources :comments do
     resources :comments
  end

  resources :hollas, only: :show do
    resources :comments
    member do
      patch :like
      put :like
    end
  end

  resources :users, path: :terps do
    resources :room_msgs
    resources :hollas do
      resources :comments do
        resources :comments
      end
    end
  end

end
