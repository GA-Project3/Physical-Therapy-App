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
		patient_params = params.require(:patient).permit(:first_name, :last_name, :email, :password, :description)
		@patient = Patient.new(patient_params)
		if @patient.save
			# binding.pry
			login(@patient, 'patients')
			redirect_to "/patients/#{@patient.id}"
		else 
			redirect_to '/patients/new'
		end
	end

	#individual patient show page
	def show
		@patient = Patient.find(params[:id])
		@exercises = @patient.exercises
		@doctor = @patient.doctor
		render :show
	end

	#edit individual patient's profile page
	def edit
		
		@patient = Patient.find(params[:id])
		render :edit
	end

	#update patient's profile
	def update
		@patient = Patient.find(params[:id])
		patient_params = params.require(:patient).permit(:first_name, :last_name, :phone, :location, :email, :password, :description)

		if @patient.update_attributes(patient_params)
			redirect_to "/patients/#{@patient.id}"
		else
			render :edit
		end

	end

	#delete patient's profile
	def destroy
		@patient = Patient.find(params[:id])
		@patient.destroy
		redirect_to '/'
	end

	#special route to assign or unassign exercise to patient
	def assign_exercise
		patient_id = params['ids'][:patient_id]
		exercise_id = params['ids'][:exercise_id]
		patient = Patient.find(patient_id)
		exercise = Exercise.find(exercise_id)
		p "***************************************************Patient ID:"+patient.id.to_s+" "+exercise.id.to_s
		if patient.exercises.include?(exercise)
			p "***************************************************Already exists"
			patient.exercises << exercise
			render json: {
			  error: "No such user; check the submitted email address",
			  status: 200
			}, status: 400
			redirect_to doctor_path
		else
			render :status => 412
			redirect_to patient_exercises_path
		end
	end

	def patient_exercises
		@patient = Patient.find(params[:id])
		@exercises = Exercise.all
		@patient_exercises = @patient.exercises

		render :exercises
	end

end












