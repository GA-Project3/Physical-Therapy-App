class Patient < ActiveRecord::Base

  belongs_to :doctor
  has_many :exercises, through: :patient_exercises
end
