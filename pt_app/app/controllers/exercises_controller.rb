class ExercisesController < ApplicationController

	#exercise index
	def index
		@exercises = Exercise.all
		render :index
	end

	#individual exercise show page
	def show
		@exercise = Exercise.find(params[:id])
		render :show
	end

	def edit
		@exercise_update = Exercise.find(params[:id])
		render "/exercises/edit"
	end

	def new
		@exercise = Exercise.new
		render :new
	end

	#create new exercise - this needs review
	def create
		params[:exercises][#:doctor_id] = current_doctor.id

		exercise = Exercise.find(params[:id])

		Exercise.create(exercise_params)

		exercise_params = params.require(:exercises).permit(#exerciseparams)

		redirect_to "/exercises/#{exercise.id}"
	end


	def update
		@exercise_update = Exercise.find(params[:id])
		exercise_params = params.require(:exercise).permit(:name, :description)

		if @exercise_update.update_attributes(exercise_params)
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
