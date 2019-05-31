Rails.application.routes.draw do
  get 'search' => 'search#index'
  devise_for :users
  get 'index/index'
	root to: 'index#index'
	resources :users
	resources :posts, except: %i[edit update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
