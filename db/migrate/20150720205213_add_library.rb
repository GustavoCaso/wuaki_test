class AddLibrary < ActiveRecord::Migration
  def change
    create_table :libraries do |t|
      t.references :user

      t.timestamps null: false
    end
  end
end
