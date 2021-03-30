Rails.application.routes.draw do
    devise_for :users
    root to: 'items#index'
    resources :items do
      resources :buys, only:[:index, :create]
      

      resources :users, only: [:show, :edit, :update] do
        resources :addresses, only: [:edit, :update]
      end
  end
end
