class ExercisesController < ApplicationController

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
			redirect_to "/exercises/#{exercise.id}"
		else
			redirect_to "/exercises/new"
		end
	end


	#edit with AJAX so can be udpated w/o page load
	def update
		@exercise = Exercise.find(params[:id])
		# exercise_params = params.require(:exercise).permit(:name, :description)

		if @exercise.update_attributes(exercise_params)
			redirect_to "/exercises/#{@exercise.id}"
		else
			render :edit
		end
	end

	def destroy
		@exercise = Exercise.find(params[:id])
		@exercise.destroy
		redirect_to '/exercises'
	end

private

def exercise_params

    params.permit(:exercise, :title, :description, :body_part, :image_url)

  end


end
