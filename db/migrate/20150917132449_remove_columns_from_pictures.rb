class RemoveColumnsFromPictures < ActiveRecord::Migration
  def change
    remove_column :pictures, :movie_token
    remove_column :pictures, :description
  end
end
