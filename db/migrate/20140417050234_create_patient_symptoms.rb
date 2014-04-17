class CreatePatientSymptoms < ActiveRecord::Migration
  def change
    create_table :patient_symptoms do |t|
      t.integer :patient_id
      t.integer :symptom_id

      t.timestamps
    end
  end
end
