class Exercise < ActiveRecord::Base
   has_many :patients, through: :patient_exercises
   has_many :patient_exercises
end
