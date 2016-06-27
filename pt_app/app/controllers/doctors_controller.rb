class DoctorsController < ApplicationController

	def index
		@doctors = Doctor.all
		render :index
	end

	#individual doctor show page/doctor profile page
	def show
		@doctor = Doctor.find(params[:id])
		render :show
	end

end
