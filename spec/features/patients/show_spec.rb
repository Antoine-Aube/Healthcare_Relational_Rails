require "rails_helper"

RSpec.describe "Patients Index" do 
  describe "index" do 
    it "lists all of a patients necessary attributes" do 
      hospital = Hospital.create!(name: "St. Mary's", rating: 4, trauma: true, research: false)
      patient = hospital.patients.create!(name: "Jeff", age: 44, ailment: "Broken Leg",in_patient: false)

      visit "/patients/#{patient.id}"

      expect(page).to have_content(patient.name)
      expect(page).to have_content(patient.age)
      expect(page).to have_content(patient.ailment)
      expect(page).to have_content(patient.in_patient)
    end
  end
end