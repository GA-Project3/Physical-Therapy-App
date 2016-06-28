Rails.application.routes.draw do

	##resources/rails created routes##
	resources :doctors, :patients, :exercises

	##home page##
	get '/', to: 'home#home', as: 'home'

	##about page##
	get '/about', to: 'home#about', as: 'about'

	##signin/sessions##
	get '/signin', to: "sessions#new"


	##resources/rails created routes##
	resources :doctors
  resources :patients, :exercises


	#add new exercise
	# get '/exercises', to: 'exercises#index'
	get '/exercises/new', to: "exercises#new", as: "new_exercise"

	post "/exercises/new", to: "exercises#create"

	#edit exercise, return edit form for editing exercise
	get "/exercises/:id/edit", to: "exercises#edit", as: "edit"

	get "exercises/:id", to: "exercises#show"



end
