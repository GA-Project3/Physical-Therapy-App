class PatientsController < ApplicationController

	def index
		@patients= Patient.all
		render :index
	end


end
