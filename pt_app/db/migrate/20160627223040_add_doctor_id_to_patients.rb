class AddDoctorIdToPatients < ActiveRecord::Migration
  def change
    change_table :patients do |p|
    p.references :doctor, index: true, foreign_key: true
    end
  end
end
