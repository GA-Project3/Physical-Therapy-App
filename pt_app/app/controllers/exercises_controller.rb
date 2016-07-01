class ExercisesController < ApplicationController
	helper ExercisesHelper

	before_action :require_login
	before_action :is_doctor, only:[:edit, :new]
	#exercise index
	def index
		@exercises = Exercise.all
		render :index
	end

	#individual exercise show page
	def show
		# @exercises = Exercise.all
		@exercise = Exercise.find(params[:id])
		render :show
	end

	def edit
		@exercise = Exercise.find(params[:id])
		render 'edit'
	end

	def new
		@exercise = Exercise.new
		render :new
	end

	# #create new exercise
	def create
		# exercise_params = params.require(:exercise),permit(:title, :description, :image_url)
		@exercise = Exercise.new(exercise_params)
		if @exercise.save
			flash[:success] = "Created!"
			redirect_to "/exercises/#{@exercise.id}"
		else
			flash[:error] = @exercise.errors.full_messages.join("---")
			redirect_to "/exercises/new"
		end
	end


	#edit with AJAX so can be udpated w/o page load
	def update
		@exercise = Exercise.find(params[:id])
		# exercise_params = params.require(:exercise).permit(:name, :description)

		if @exercise.update_attributes(exercise_params)
			flash[:success] = "Updated!"
			redirect_to "/exercises/#{@exercise.id}"
		else
			flash[:error] = @exercise.errors.full_messages.join("---")
			render :edit
		end
	end

	def destroy
		@exercise = Exercise.find(params[:id])
		if @exercise.patients
			@exercise.patients.delete(@exercise.patients)
			@exercise.save
		end
		@exercise.destroy
		flash[:success] = "Updated!"
		redirect_to '/exercises'
	end

private

	def exercise_params

    	params.require(:exercise).permit(:title, :description, :body_part, :image_url)

 	end


end
