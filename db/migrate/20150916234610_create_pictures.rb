class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.references :movie, index: true, foreign_key: true
      t.string :description
      t.string :movie_token
      t.attachment :image

      t.timestamps null: false
    end
  end
end
