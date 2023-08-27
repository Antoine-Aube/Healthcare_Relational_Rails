class Hospital < ApplicationRecord
  has_many :patients
  validates :name, presence: true
  validates :rating, presence: true

  def patient_count
    patients.count
  end

  def self.order_by_creation
    Hospital.order("created_at desc")
  end
  
  def order_patients_alphabetically
    self.patients.order("name")
  end

  def age_threshold(patient_age)
    self.patients.where("age > ?", "#{patient_age}")
  end
end