class CreateDiseaseSymptoms < ActiveRecord::Migration
  def change
    create_table :disease_symptoms do |t|
      t.integer :disease_id
      t.integer :symptom_id
      t.integer :level_id
      t.integer :pct

      t.timestamps
    end
  end
end
