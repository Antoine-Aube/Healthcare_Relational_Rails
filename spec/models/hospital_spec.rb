require "rails_helper"

RSpec.describe Hospital, type: :model do 
  let(:hospital_1) {Hospital.new}
  let(:patient_1) {Patient.new}
  let(:patient_2) {Patient.new}
  

  describe "Initialize" do 
    it{expect(hospital_1).to be_a Hospital}
  end

  describe "#patient_count" do 
    it "returns a count of patients as an integer" do 
      hospital = Hospital.create!(name: "St. Mary's", rating: 4, trauma: true, research: false)
      patient = hospital.patients.create!(name: "Jeff", age: 44, ailment: "Broken Leg",in_patient: false)
      patient_2 = hospital.patients.create!(name: "Ted", age: 36, ailment: "Broken Face",in_patient: true)

      expect(hospital.patient_count).to eq(2)
    end
  end
end