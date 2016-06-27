class CreatePatients < ActiveRecord::Migration

  def change
    create_table :patients do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :image_url
      t.string :phone_number
      t.string :location
      t.string :diagnosis
      t.string :password_digest

      t.timestamps null: false
    end
  end
end
