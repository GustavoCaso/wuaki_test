class AddLibrarySeasons < ActiveRecord::Migration
  def change
    create_table :user_seasons do |t|
      t.integer :library_id
      t.integer :season_id
      t.datetime :purchased_at, null: false
      t.datetime :expire_at, null: false

      t.timestamps null: false
    end
    add_index :user_seasons, :library_id
    add_index :user_seasons, :season_id
  end
end
