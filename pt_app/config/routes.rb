Rails.application.routes.draw do

	##home page##
	get '/', to: 'home#home', as: 'home'

	##about page##
	get '/about', to: 'home#about', as: 'about'

	##signin/sessions##
	get '/signin', to: "sessions#new"

	##resources/rails created routes##
	resources :doctors, :patients, :exercises

end
