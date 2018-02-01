Rails.application.routes.draw do
  	devise_for :users
	    namespace :api, defaults: {format: :json} do
	    	namespace :v1 do      
		      mount_devise_token_auth_for 'User', at: 'auth', controllers: {
		      	sessions:  'api/v1/sessions',
		        registrations:  'api/v1/registrations'
		      }
	  		end
		end
	get 'restaurants/index'
	root 'restaurants#index'
  	resources :restaurants
    resources :menus
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
