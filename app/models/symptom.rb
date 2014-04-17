class Symptom < ActiveRecord::Base
  has_many :diseases,:through=> :disease_symptoms
  has_many :disease_symptoms

  accepts_nested_attributes_for :diseases ,:allow_destroy => true
  belongs_to :part
  belongs_to :feel
  has_many :patients,:through=> :patient_symptoms
  has_many :patient_symptoms

  accepts_nested_attributes_for :patients ,:allow_destroy => true
  scope :by_part, lambda { |id|
      where(:part_id=>id)
  }  
end
