require "rails_helper"

RSpec.describe Patient, type: :model do 
  let(:patient_1) {Patient.new}

  describe "relationships" do 
    it{should belong_to :hospital}
  end

  describe "validations" do 
    it{should validate_presence_of(:name)}
    it{should validate_presence_of(:age)}
    it{should validate_presence_of(:ailment)}
    it{should allow_value(true).for(:in_patient)}
    it{should allow_value(false).for(:in_patient)}
  end
  
  describe "Initialize" do
    it{expect(patient_1).to be_a Patient}
  end

  #how can I test this class method? 
  describe "#in_patient?" do
    it "checks if patient is has a value of true in in_patient" do 
      hospital = Hospital.create!(name: "St. Mary's", rating: 4, trauma: true, research: false)
      patient = hospital.patients.create!(name: "Jeff", age: 44, ailment: "Broken Leg",in_patient: true)
      patient_2 = hospital.patients.create!(name: "Steve", age: 47, ailment: "Broken Arm",in_patient: false)
      patient_3 = hospital.patients.create!(name: "Sarah", age: 87, ailment: "Broken Hip",in_patient: true)

      in_patients = Patient.in_patient?
      expect(in_patients).to include(patient, patient_3)
    end 
  end
end