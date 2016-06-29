Rails.application.routes.draw do

	##home page##
	get '/', to: 'home#home', as: 'home'

	##about page##
	get '/about', to: 'home#about', as: 'about'


	##signin/sessions##
	get '/signin', to: 'sessions#new'

	##create a session##
	post '/sessions', to:'sessions#create'

	delete '/sessions', to: 'sessions#destroy'


	#add new exercise
	# get '/exercises', to: 'exercises#index'
	get '/exercises/new', to: 'exercises#new', as: 'new_exercise'

	post '/exercises/new', to: 'exercises#create'

	#edit exercise, return edit form for editing exercise
	get '/exercises/:id/edit', to: 'exercises#edit', as: 'edit'

	get '/exercises/:id', to: 'exercises#show'

	delete '/exercises/:id', to: 'exercises#destroy', as: 'delete'

	get '/patients/:id/assign_exercise', to: 'patients#assign_exercise'

	##resources/rails created routes##
	resources :doctors, :patients, :exercises


end
