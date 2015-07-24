class AddMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.string :plot
      t.float :price, null: false

      t.timestamps null: false
    end
  end
end
