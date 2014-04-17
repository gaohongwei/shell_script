class Disease < ActiveRecord::Base
  has_many :symptoms,:through=> :disease_symptoms
  has_many :disease_symptoms

  attr_reader :tokens
  accepts_nested_attributes_for :symptoms ,:allow_destroy => true
  has_many :patients,:through=> :patient_diseases
  has_many :patient_diseases

  accepts_nested_attributes_for :patients ,:allow_destroy => true
  scope :by_patient, lambda { |id|
    Disease.joins(:disease_symptoms=>[:symptom=>:patient_symptoms]).merge(PatientSymptom.by_patient(id))
  }
  def tokens=(ids)
    self.symptom_ids = ids.split(",")
  end
end