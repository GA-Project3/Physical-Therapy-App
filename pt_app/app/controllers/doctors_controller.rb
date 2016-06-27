class DoctorsController < ApplicationController

	def index
		@doctors = Doctor.all
		render :index
	end
end
