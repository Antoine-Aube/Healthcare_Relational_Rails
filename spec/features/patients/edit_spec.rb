require "rails_helper"

RSpec.describe "Patients Edit" do 
  before :each do 
   @hospital = Hospital.create!(name: "St. Mary's", rating: 4, trauma: true, research: false)
   @patient = @hospital.patients.create!(name: "Jeff", age: 44, ailment: "Broken Leg",in_patient: true)
   @patient_2 = @hospital.patients.create!(name: "Lucy", age: 12, ailment: "Runny nose",in_patient: false)

 end
  describe "When I visit /patients/:id/edit" do
    it "has fields to edit the patient selected with pre-populated content" do 
      visit "/patients/#{@patient.id}/edit"
      expect(page).to have_content("Edit patient data for Jeff")
      expect(page).to have_field(:name, with: "Jeff")
      expect(page).to have_field(:age, with: 44)
      expect(page).to have_field(:ailment, with: "Broken Leg")
      expect(page).to have_checked_field(:in_patient)

      expect(page).to have_button("Submit")

      click_button "Submit"

      expect(current_path).to eq("/patients/#{@patient.id}")
    end

    it "can edit fields with new content that then render on '/patient/patient.id' page" do
      visit "/patients/#{@patient.id}/edit"

      fill_in(:name, with: "Not Jeff")
      fill_in(:age, with: 102)
      fill_in(:ailment, with: "cured")
      uncheck(:in_patient)

      click_button "Submit"
    
      expect(current_path).to eq("/patients/#{@patient.id}")
      expect(page).to have_content("Not Jeff")
      expect(page).to have_content(102)
      expect(page).to have_content("cured")
      expect(page).to have_content("false")
    end
  end
end