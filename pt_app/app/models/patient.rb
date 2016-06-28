class Patient < ActiveRecord::Base
	attr_accessor :user_t

  belongs_to :doctor
  has_many :exercises, through: :patient_exercises
  has_many :patient_exercises

  has_secure_password

  def self.confirm(params)
  	@patient = Patient.find_by({email: params[:email]})
  	@patient.try(:authenticate, params[:password])
  end

end
