class AddEpisodes < ActiveRecord::Migration
  def change
    create_table :episodes do |t|
      t.string :title
      t.string :plot
      t.references :season
      t.integer :number

      t.timestamps null: false
    end
  end
end
