class Hospital < ApplicationRecord
  has_many :patients

  def patient_count
    patients.count
  end

  def self.order_by_creation
    Hospital.order("created_at desc")
  end
  
  def order_patients_alphabetically
    self.patients.order("name")
  end
end