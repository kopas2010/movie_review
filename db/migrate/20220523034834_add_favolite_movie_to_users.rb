class AddFavoliteMovieToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :favolite_movie, :string
  end
end
