class CreateDiseases < ActiveRecord::Migration
  def change
    create_table :diseases do |t|
      t.string :name
      t.integer :same_id

      t.timestamps
    end
  end
end
