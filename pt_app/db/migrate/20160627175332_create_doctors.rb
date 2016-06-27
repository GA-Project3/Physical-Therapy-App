class CreateDoctors < ActiveRecord::Migration
  def change
    create_table :doctors do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.string :location
      t.string :phone
      t.string :description
      t.string :image_url

      t.timestamps null: false
    end
  end
end
