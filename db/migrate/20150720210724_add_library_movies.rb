class AddLibraryMovies < ActiveRecord::Migration
  def change
    create_table :user_movies do |t|
      t.integer :library_id
      t.integer :movie_id
      t.datetime :purchased_at, null: false
      t.datetime :expire_at, null: false

      t.timestamps null: false
    end
    add_index :user_movies, :library_id
    add_index :user_movies, :movie_id
  end
end
