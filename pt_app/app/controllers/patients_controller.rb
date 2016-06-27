class PatientsController < ApplicationController

	# before_action :require_login

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
		patient_params = params.require(:period).permit(:first_name, :last_name, :email, :password, :description)
		@patient = Patient.new(patient_params)
		if @patient.save
			login(@patient)
			redirect_to "/patients/#{@patient.id}"
		else
		end
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

	end

	#delete patient's profile
	def destroy
		@patient = Patient.find(params[:id])
		@patient.destroy
		redirect_to '/'
	end

end
