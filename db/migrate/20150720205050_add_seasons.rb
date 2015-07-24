class AddSeasons < ActiveRecord::Migration
  def change
    create_table :seasons do |t|
      t.string :title
      t.string :plot
      t.float  :price, null: false
      t.timestamps null: false
    end
  end
end
