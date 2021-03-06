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
    doctor_params = params.require(:doctor).permit(:first_name, :last_name, :email, :password, :description, :image_url)
    @doctor = Doctor.new(doctor_params)
    if @doctor.save
      login(@doctor, 'doctors')
      flash[:success] = "Profile created!"
      redirect_to "/doctors/#{@doctor.id}"
    else
      flash[:error] = @doctor.errors.full_messages.join("---")
      redirect_to '/doctors/new'
    end
  end

  def edit

    @doctor = Doctor.find(params[:id])
    render :edit
  end



  #update patient's profile
  def update
    @doctor = Doctor.find(params[:id])
    @doctor.update_attributes(doctor_params)


    if @doctor.update_attributes(doctor_params)
      redirect_to "/doctors/#{@doctor.id}"
      flash[:notice] = "Profile Updated!"
    else
      flash[:error] = @doctor.errors.full_messages.join("---")
      render :edit
    end
  end

  def doctor_params
    params.require(:doctor).permit(:first_name, :last_name, :phone, :location, :image_url, :email, :password, :description)
  end
end










