class Exercise < ActiveRecord::Base
	validates :title, presence: true
	validates :body_part, presence: true
	validates :description, presence: true

   has_many :patients, through: :patient_exercises
   has_many :patient_exercises
end
