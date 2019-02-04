Rails.application.routes.draw do
  	get 'welcome/index'
	devise_for :users
	resources :wikis

	root 'welcome#index'
end
