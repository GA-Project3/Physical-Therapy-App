class DoctorsController < ApplicationController

  before_action :require_login, :except => [:index, :new, :create]
  before_action :doctor_profile?, only:[:edit]


	def index
		@doctors = Doctor.all
    # @doctor = Doctor.find(doctor_params)
		render :index
	end

  def new
    @doctor = Doctor.new
    render :new
  end

	#individual doctor show page/doctor profile page
	def show
		@doctor = Doctor.find(params[:id])
		render :show
	end

  #doctors create new profiles
  def create
    doctor_params = params.require(:doctor).permit(:first_name, :last_name, :email, :password, :description)
    @doctor = Doctor.new(doctor_params)
    if @doctor.save
      login(@doctor, 'doctors')
      redirect_to "/doctors/#{@doctor.id}"
    else 
      redirect_to '/doctors/new'
    end
  end

end
