Rails.application.routes.draw do
 
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'sending_destinations', to: 'users/registrations#newSendingDestination'
    post 'sending_destinations', to: 'users/registrations#createSendingDestination'
  end
   
  root to: 'items#index'
    
    resources :items, only: [:new, :create, :update] do
      collection do
        get 'get_category_child', to: 'items#get_category_child', defaults: { format: 'json' }
        get 'get_category_grandchild', to: 'items#get_category_grandchild', defaults: { format: 'json' }
      end
    end