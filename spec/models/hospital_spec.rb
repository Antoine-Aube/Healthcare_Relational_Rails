require "rails_helper"

RSpec.describe Hospital, type: :model do  
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
    hospital = Hospital.new(name: "Hospital")
    it{expect(hospital).to be_a Hospital}
  end
  
  describe "#patient_count" do 
  it "returns a count of patients as an integer" do 
    hospital_1 = Hospital.create!(name: "St. Mary's", rating: 4, trauma: true, research: false)
      patient_1 = hospital_1.patients.create(name: "Jeff", age: 44, ailment: "Broken Leg",in_patient: false)
      patient_2 = hospital_1.patients.create(name: "Ted", age: 36, ailment: "Broken Face",in_patient: true)
      
      expect(hospital_1.patient_count).to eq(2)
    end
  end

  describe "#order_by_creation" do 
    it "lists all hospital objects in desc order by created_at" do 
      hospital_1 = Hospital.create!(name: "St. Mary's", rating: 4, trauma: true, research: false)
      hospital_2 = Hospital.create!(name: "Intermoutain", rating: 5, trauma: true, research: true, created_at: 1.day.ago)
      hospital_3 = Hospital.create!(name: "Denver General", rating: 5, trauma: true, research: false, created_at: 2.days.ago)
      # require 'pry';binding.pry
      expect(Hospital.order_by_creation).to eq([hospital_1, hospital_2, hospital_3])
    end
  end
  
  describe "order_patients_alphabetically" do 
    it "order patients alphabetically for a hospital object by name" do 
      hospital_1 = Hospital.create!(name: "St. Mary's", rating: 4, trauma: true, research: false)
      patient_1 = hospital_1.patients.create!(name: "Amanda", age: 44, ailment: "Broken Leg",in_patient: false)
      patient_2 = hospital_1.patients.create!(name: "Bruce", age: 56, ailment: "Broken Face",in_patient: true)
      patient_3 = hospital_1.patients.create!(name: "Carla", age: 36, ailment: "Broken Face",in_patient: true)
          
      expect(hospital_1.order_patients_alphabetically).to eq([patient_1, patient_2, patient_3])
    end
  end
  
  describe "#age_threshold" do 
    it "returns only the adult objects for a given hospital older than the age in argument" do 
      hospital_1 = Hospital.create!(name: "St. Mary's", rating: 4, trauma: true, research: false)
      patient_1 = hospital_1.patients.create!(name: "Jeff", age: 6, ailment: "Broken Leg",in_patient: false)
      patient_2 = hospital_1.patients.create!(name: "Carrie", age: 12, ailment: "Broken Face",in_patient: true)
      patient_3 = hospital_1.patients.create!(name: "Rick", age: 24, ailment: "Broken Face",in_patient: true)
      patient_4 = hospital_1.patients.create!(name: "Amanda", age: 36, ailment: "Broken Face",in_patient: true)
      
      expect(hospital_1.age_threshold(18)).to eq([patient_3, patient_4])
    end
  end
end