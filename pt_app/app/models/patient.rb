class Patient < ActiveRecord::Base
	attr_accessor :user_t

	validates :email, presence: true, uniqueness:true, confirmation: true
	validates :first_name, presence: true
	validates :last_name, presence: true
	

	belongs_to :doctor
	has_many :exercises, through: :patient_exercises
	has_many :patient_exercises

	has_secure_password

	def self.confirm(params)
		@patient = Patient.find_by({email: params[:email]})
		@patient.try(:authenticate, params[:password])
	end

end
