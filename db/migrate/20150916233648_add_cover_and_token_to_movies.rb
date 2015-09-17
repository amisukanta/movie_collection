class AddCoverAndTokenToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :cover, :integer
    add_column :movies, :token, :string
  end
end
