require "rails_helper"

RSpec.describe "Patients Index" do 
  describe "index" do 
    it "lists all of a patients necessary attributes" do 
      hospital = Hospital.create!(name: "St. Mary's", rating: 4, trauma: true, research: false)
      patient = hospital.patients.create!(name: "Jeff", age: 44, ailment: "Broken Leg",in_patient: true)

      visit "/patients"

      expect(page).to have_content(patient.name)
      expect(page).to have_content(patient.age)
      expect(page).to have_content(patient.ailment)
      expect(page).to have_content(patient.in_patient)
    end

    it "has a link that goes to view that particular patient" do 
      hospital = Hospital.create!(name: "St. Mary's", rating: 4, trauma: true, research: false)
      patient_1 = hospital.patients.create!(name: "Jeff", age: 44, ailment: "Broken Leg",in_patient: true)
      # patient_2 = hospital.patients.create!(name: "Erica", age: 32, ailment: "Broken Arm",in_patient: true)
      
      visit "/patients"
      click_link "Go to Patient"
      
      expect(current_path).to eq("/patients/#{patient_1.id}")
    end
    
    it "has a link that goes to edit the patients data" do 
      hospital = Hospital.create!(name: "St. Mary's", rating: 4, trauma: true, research: false)
      patient_1 = hospital.patients.create!(name: "Jeff", age: 44, ailment: "Broken Leg",in_patient: true)

      visit "/patients"
      click_link "Edit Patient Data"

      expect(current_path).to eq("/patients/#{patient_1.id}/edit")
    end
    
    it "has a link to the hospitals index page" do 
      visit "/hospitals"
      
      click_link "Hospitals"
      expect(current_path).to eq("/hospitals")
    end
    
    it "has a link to the patients index page" do 
      visit "/hospitals"
      
      click_link "Patients"
      expect(current_path).to eq("/patients")
    end
    
    it "has a link to the Home page" do 
      visit "/hospitals"
      click_link "Homepage"
      
      expect(current_path).to eq("/")
    end
  end
end