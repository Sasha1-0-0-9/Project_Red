Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  get 'orders/show'
  devise_for :users

  # devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :products do
    get 'search', on: :collection
    get 'show', on: :collection
  end
  resources :categories, only: :show do
    resources :products, only: %i[index show]
  end
  resources :products do
    resources :order_items, only: %i[create update destroy] do
      member do
        get 'add_quantity'
        get 'remove_quantity'
      end
    end
  end

  resources :orders, only: :show
  root 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
