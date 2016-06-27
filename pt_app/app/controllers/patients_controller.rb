class PatientsController < ApplicationController

	#patients index
	def index
		@patients= Patient.all
		render :index
	end
	
	#individual patient show page
	def show
		@patient = Patient.find(params[:id])
		render :show
	end

end
