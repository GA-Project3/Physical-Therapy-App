Rails.application.routes.draw do

	##home page##
	get '/', to: 'home#home', as: 'home'

	##about page##
	get '/about', to: 'home#about', as: 'about'

	resources :doctors, :patients, :exercises

end
