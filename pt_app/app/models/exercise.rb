class Exercise < ActiveRecord::Base
   has_many :patients, through: :patient_exercises
end
