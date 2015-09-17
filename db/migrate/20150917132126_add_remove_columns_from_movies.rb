class AddRemoveColumnsFromMovies < ActiveRecord::Migration
  def change
    remove_column :movies, :token
    remove_column :movies, :cover
    add_column :movies, :director, :string
    add_column :movies, :stars, :string
  end
end
