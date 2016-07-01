class PatientsController < ApplicationController

	before_action :require_login, :except => [:new, :create]
	before_action :is_patient, only:[:edit]
	before_action :patient_profile?, only:[:edit, :show]


	#patients index
	def index
		@patients= Patient.all
		render :index
	end

	def new
		@patient = Patient.new
		render :new
	end

	#create a new patient
	def create
		patient_params = params.require(:patient).permit(:first_name, :last_name, :email, :password, :description, :diagnosis)
		@patient = Patient.new(patient_params)
		if @patient.save
			# binding.pry
			login(@patient, 'patients')
			redirect_to "/patients/#{@patient.id}/physician_list"
		else
			redirect_to '/patients/new'
		end
	end


	#select physician during signup#
	def physician_list
		@doctors = Doctor.all
		render :select_physician
	end

	def select_physician
		patient = Patient.find(params[:id])
		doctor_id = params[:doctor_id]
		doctor = Doctor.find(doctor_id)
		patient.doctor = doctor
		if patient.save
			redirect_to "/patients/#{patient.id}"
		else
			redirect_to "/patients/#{patient.id}/physician_list"
		end
	end

	#individual patient show page
	def show
		@patient = Patient.find(params[:id])
		@exercises = @patient.exercises
		@doctor = @patient.doctor
	end

	#edit individual patient's profile page
	def edit
    @patient = Patient.find(params[:id])
		render :edit
	end

	#update patient's profile
	def update
		@patient = Patient.find(params[:id])
    	@patient.update_attributes(patient_params)


		if @patient.update_attributes(patient_params)
			flash[:success] = "Updated!"
			redirect_to "/patients/#{@patient.id}"
		else
			render :edit
		end

	end

  def patient_params
    params.require(:patient).permit(:first_name, :last_name, :phone, :location, :email, :password, :description, :image_url, :diagnosis)
  end
	#delete patient's profile
	def destroy
		@patient = Patient.find(params[:id])
		@patient.destroy
		redirect_to '/'
	end

	#special route to assign or unassign exercise to patient
	def assign_exercise
		patient_id = params[:id]
		exercise_id = params['ids'][:exercise_id]
		patient = Patient.find(patient_id)
		exercise = Exercise.find(exercise_id)
		if patient.exercises.include?(exercise)
			render json: {
			  error: "This exercise already belongs to the patient",
			  status: 412 }, status: 412
		else
			patient.exercises << exercise
			patient.save
			render json: {}, status: 200
		end
	end

	def remove_exercise
		patient_id = params[:id]
		exercise_id = params['ids'][:exercise_id]
		patient = Patient.find(patient_id)
		exercise = Exercise.find(exercise_id)
		if patient.exercises.include?(exercise)
			patient.exercises.delete(exercise)
			patient.save
			render json: {}, status: 200
		else
			render json: {
			  error: "This exercise already is absent from the patient",
			  status: 412 }, status: 412
		end
	end

	def patient_exercises
		@patient = Patient.find(params[:id])
		@exercises = Exercise.all
		@patient_exercises = @patient.exercises

		render :exercises
	end

end












