class Patient < ActiveRecord::Base
  has_many :symptoms,:through=> :patient_symptoms
  has_many :patient_symptoms

  accepts_nested_attributes_for :symptoms ,:allow_destroy => true
  has_many :diseases,:through=> :patient_diseases
  has_many :patient_diseases

  accepts_nested_attributes_for :diseases ,:allow_destroy => true
end
