Rails.application.routes.draw do
  resources :events
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'home/index'

  root 'home#index'

  resources :hollas, only: :show do
    resources :comments do
      resources :comments
    end

    member do
      patch :like
      patch :hate
      put :like
      put :hate
    end
  end

  resources :comments do
     resources :comments
  end
  resources :users, path: :terps do
    resources :hollas do
      resources :comments do
        resources :comments
      end
      member do
        put :like
        put :hate
      end
    end
    resources :events
  end
  devise_for :users
end
