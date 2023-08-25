require "rails_helper"

RSpec.describe Hospital, type: :model do 
  let(:hospital_1) {Hospital.new}
  let(:patient_1) {Patient.new}
  let(:patient_2) {Patient.new}
  
  describe "relationship" do 
    it{should have_many :patients}
  end

  describe "validations" do 
    it{should validate_presence_of(:name)}
    it{should validate_presence_of(:rating)}
    it{should allow_value(true).for(:research)}
    it{should allow_value(false).for(:research)}
    it{should allow_value(true).for(:trauma)}
    it{should allow_value(false).for(:trauma)}
  end
  

  describe "Initialize" do 
    it{expect(hospital_1).to be_a Hospital}
  end

  #how can I test this class method? 
  describe "#patient_count" do 
    it "returns a count of patients as an integer" do 
      hospital = Hospital.create!(name: "St. Mary's", rating: 4, trauma: true, research: false)
      patient = hospital.patients.create!(name: "Jeff", age: 44, ailment: "Broken Leg",in_patient: false)
      patient_2 = hospital.patients.create!(name: "Ted", age: 36, ailment: "Broken Face",in_patient: true)

      expect(hospital.patient_count).to eq(2)
    end
  end
end