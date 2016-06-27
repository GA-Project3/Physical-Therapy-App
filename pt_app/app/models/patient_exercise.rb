class PatientExercise < ActiveRecord::Base
  belongs_to :patient
  belongs_to :exercise
end
