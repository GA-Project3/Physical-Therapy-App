Rails.application.routes.draw do

	##home page##
	get '/', to: 'home#home', as: 'home'

	##about page##
	get '/about', to: 'home#about', as: 'about'

	##signin/sessions##
	get '/signin', to: 'sessions#new'

	##create a session##
	post '/sessions', to:'sessions#create'
	#delete session#
	delete '/sessions', to: 'sessions#destroy'

	# get '/exercises', to: 'exercises#index'
	get '/exercises/new', to: 'exercises#new', as: 'new_exercise'

	#add new exercise
	post '/exercises/new', to: 'exercises#create'

	#edit exercise, return edit form for editing exercise
	get '/exercises/:id/edit', to: 'exercises#edit', as: 'edit'

	get '/exercises/:id', to: 'exercises#show'

	delete '/exercises/:id', to: 'exercises#destroy', as: 'delete'


	#uploadcare routes

	get '/patients/:id/edit', to: 'patients#edit'

	patch '/patients/:id/edit', to: 'patients#update'

	put '/patients/:id/edit', to: 'patients#update'

	# get '/exercises/:id/edit', to: 'exercises#edit'

	# patch '/exercises/:id/edit', to: 'exercises#update'

	# put '/exercises/:id/edit', to: 'exercises#update'



	# custom route to enable assigning an exercise to a patient
	post '/patients/:id/assign_exercise', to: 'patients#assign_exercise'
	post '/patients/:id/remove_exercise', to: 'patients#remove_exercise'

	# nested route to enable a list of exercises attributed to patient, separate from exercises index page
	get '/patients/:id/exercises', to: 'patients#patient_exercises', as: 'patient_exercises'

	##patient selects physician during sign up##
	get '/patients/:id/physician_list', to: 'patients#physician_list', as: 'physician_list'

	#associate patient-id with doctor-id'
	post '/patients/:id/physician_list', to: 'patients#select_physician', as: "select_physician_patient"

	##resources/rails created routes##
	resources :patients, :doctors 
	# resources :exercises, only: [:index, :update, :create, :new, :edit]
	resources :exercises

end
