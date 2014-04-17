class PatientSymptom < ActiveRecord::Base
  belongs_to :patient
  belongs_to :symptom
  scope :by_patient, lambda { |id|
      where(:patient_id=>id)
  }


end