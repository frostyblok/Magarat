Rails.application.routes.draw do
  devise_for :users
  get 'index/index'
	root to: 'index#index'
	resources :users
	resources :posts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
