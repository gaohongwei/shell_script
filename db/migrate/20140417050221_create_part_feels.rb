class CreatePartFeels < ActiveRecord::Migration
  def change
    create_table :part_feels do |t|
      t.integer :part_id
      t.integer :feel_id

      t.timestamps
    end
  end
end
