Rails.application.routes.draw do
    devise_for :users
    root to: 'items#index'
    resources :items, only: [:new,:create]
    # resources :buys, only: [:index, :create]
end



