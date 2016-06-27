class CreatePatientExercises < ActiveRecord::Migration

  def change
    create_table :patient_exercises do |t|
      t.references :patient, index: true, foreign_key: true
      t.references :exercise, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
