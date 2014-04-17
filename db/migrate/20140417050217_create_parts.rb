class CreateParts < ActiveRecord::Migration
  def change
    create_table :parts do |t|
      t.string :name
      t.integer :area_id

      t.timestamps
    end
  end
end
