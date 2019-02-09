Rails.application.routes.draw do
  	get 'charges/create'
	get 'welcome/index'

	#devise_for :users
	devise_for :users, controllers: { registrations: 'users/registrations' }
	devise_scope :user do
		get '/users/downgrade', to: 'users/registrations#downgrade'
	end

	resources :wikis
	resources :charges, only: [:new, :create]

	root 'welcome#index'
end
