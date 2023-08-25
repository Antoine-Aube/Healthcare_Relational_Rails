class Patient < ApplicationRecord
  belongs_to :hospital
  validates :name, presence: true
  validates :age, presence: true
  validates :ailment, presence: true

  def self.in_patient?
    Patient.where("in_patient = ?", true)
  end
end