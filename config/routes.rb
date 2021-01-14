Rails.application.routes.draw do
	resources :categories, only: :show do
		resources :products, only: [:index, :show]
	end
  root 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
