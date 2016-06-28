class Doctor < ActiveRecord::Base
	attr_accessor :user_t

  has_many :patients

  def self.confirm(params)
  	@doctor = Doctor.find_by({email: params[:email]})
  	@doctor.try(:authenticate, params[:password])
  end

  def confirm_email
  end

  has_secure_password

end
