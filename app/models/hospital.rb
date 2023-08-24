class Hospital < ApplicationRecord
  has_many :patients

  def patient_count
    patients.count
  end
end