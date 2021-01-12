Rails.application.routes.draw do
  root 'pages#home'
  get '/categories', to: 'categories#index'
  resources :categories, only: :show do 
  	resources :products, only: [:index, :show]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
