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

  describe "#in_patient?" do
    it "checks if patient is has a value of true in in_patient" do 
      hospital = Hospital.create!(name: "St. Mary's", rating: 4, trauma: true, research: false)
      patient = hospital.patients.create!(name: "Jeff", age: 44, ailment: "Broken Leg",in_patient: true)

      expect(patient.in_patient?).to eq(true)
    end 
  end
end