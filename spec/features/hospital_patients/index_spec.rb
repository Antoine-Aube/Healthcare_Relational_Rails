require "rails_helper"

RSpec.describe "HospitalPatients Index" do 
  before :each do 
    @hospital_1 = Hospital.create!(name: "St. Mary's", rating: 4, trauma: true, research: false)
    @patient_1 = @hospital_1.patients.create!(name: "Anna", age: 12, ailment: "Broken Leg",in_patient: true)
    @patient_2 = @hospital_1.patients.create!(name: "Billy", age: 18, ailment: "Broken Arm",in_patient: false)
    @patient_3 = @hospital_1.patients.create!(name: "Carrie", age: 87, ailment: "Broken Hip",in_patient: true)
  end

  describe "#index" do 
    it "Shows attributes for all hospitals" do 
      visit "/hospitals/#{@hospital_1.id}/patients"
      
      expect(page).to have_content(@patient_1.name)
      expect(page).to have_content(@patient_1.age)
      expect(page).to have_content(@patient_1.ailment)
      expect(page).to have_content(@patient_1.in_patient)
      expect(page).to have_content(@patient_2.name)
      expect(page).to have_content(@patient_2.age)
      expect(page).to have_content(@patient_2.ailment)
      expect(page).to have_content(@patient_2.in_patient)
      expect(page).to have_content(@patient_3.name)
      expect(page).to have_content(@patient_3.age)
      expect(page).to have_content(@patient_3.ailment)
      expect(page).to have_content(@patient_3.in_patient)
    end
    
    it "can sort patients alphabetically on the page" do 
      visit "/hospitals/#{@hospital_1.id}/patients"
      
      click_link "Sort Patients Alphabetically"

      expect(@patient_1.name).to appear_before(@patient_2.name)
      expect(@patient_2.name).to appear_before(@patient_3.name)
    end
    
    it "can sort patients by an age threshold" do 
      visit "/hospitals/#{@hospital_1.id}/patients"
      
      fill_in("threshold", with: 20)
      
      click_button "submit"
      expect(page).to have_content(@patient_3.name)
      expect(page).to_not have_content(@patient_1.name)
    end
    
    it "has a link to form to create a new patient" do 
      visit "/hospitals/#{@hospital_1.id}/patients"

      click_link "Create New Patient"

      expect(current_path).to eq("/hospitals/#{@hospital_1.id}/patients/new")
    end
  end
end 