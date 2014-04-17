class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :name
      t.string :sex
      t.integer :year
      t.string :jiguang
      t.integer :user_id

      t.timestamps
    end
  end
end
