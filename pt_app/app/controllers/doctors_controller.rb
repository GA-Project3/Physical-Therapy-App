class DoctorsController < ApplicationController

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
    @doctor = Doctor.new(doctor_params)
    if @doctor.save
      flash[:notice] = "Hello, #{@doctor.first_name}!"
      login(@doctor)
      redirect_to "/doctors/#{@doctor.id}"
    else
      flash[:error] = @doctor.errors.full_messages.join("-----")
      redirect_to new_doctor_path
    end
  end

    def doctor_params


    params.require(:doctor).permit(:first_name, :last_name, :email, :email_confirmation, :location, :password_digest, :description, :image_url)

  end


end
