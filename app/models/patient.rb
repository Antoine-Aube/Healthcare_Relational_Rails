class Patient < ApplicationRecord
  belongs_to :hospital

  def self.in_patient?
    Patient.where("in_patient = ?", true)
  end
end