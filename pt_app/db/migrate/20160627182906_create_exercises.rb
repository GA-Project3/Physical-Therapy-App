class CreateExercises < ActiveRecord::Migration

  def change
    create_table :exercises do |t|
      t.string :title
      t.string :body_part
      t.string :description
      t.string :image_url

      t.timestamps null: false
    end
  end
end
