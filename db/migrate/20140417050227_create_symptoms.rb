class CreateSymptoms < ActiveRecord::Migration
  def change
    create_table :symptoms do |t|
      t.string :name
      t.integer :part_id
      t.integer :feel_id

      t.timestamps
    end
  end
end
