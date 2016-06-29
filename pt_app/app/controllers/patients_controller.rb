class PatientsController < ApplicationController

	before_action :require_login, :except => [:new, :create, :select_physician]
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
			login(@patient, 'patients')
			redirect_to "/patients/#{@patient.id}/select_physician"
		else 
			redirect_to '/patients/new'
		end
	end

	#select physician during signup#
	def select_physician
		@doctors = Doctor.all
		render :select_physician
	end

	def select
	end

	#individual patient show page
	def show
		@patient = Patient.find(params[:id])
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


	def patient_exercises
		@patient = Patient.find(params[:id])
		@exercises = Exercise.all
		@patient_exercises = @patient.exercises

		render :exercises
	end

	
	def assign (patient_id, exercise_id)
		p = Patient.find(patient_id)
		p.exercises << Exercise.find(exercise_id)
	end



end
