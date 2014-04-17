class CreateFeels < ActiveRecord::Migration
  def change
    create_table :feels do |t|
      t.string :name

      t.timestamps
    end
  end
end
