class ExercisesController < ApplicationController

	#exercise index
	def index
		@exercises = Exercise.all
		render :index
	end

	#individual exercise show page
	def show
		@exercises = Exercise.all
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

	# #create new exercise - this needs review
	def create

		exercise_params = params.require(:exercise),permit(:title, :description, :image_url)
		@exercise = Exercise.create(exercise_params)

		redirect_to "/exercises"
	end


	#edit with AJAX so can be udpated w/o page load
	def update
		@exercise = Exercise.find(params[:id])
		exercise_params = params.require(:exercise).permit(:name, :description)

		if @exercise.update_attributes(exercise_params)
			flash[:success] = "Exercise has been updated"

			exercise = Exercise.find(params[:id])
			redirect_to "/exercises/#{exercise.id}"

		else redirect_to :show #sb check

		end
	end


	def destroy
		ex = Exercise.find(params[:id])
		ex.destroy
		redirect_to :index
	end



end
