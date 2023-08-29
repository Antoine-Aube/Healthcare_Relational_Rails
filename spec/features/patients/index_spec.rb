require "rails_helper"

RSpec.describe "Patients Index" do 
  before :each do 
    @hospital = Hospital.create!(name: "St. Mary's", rating: 4, trauma: true, research: false)
    @patient_1 = @hospital.patients.create!(name: "Jeff", age: 44, ailment: "Broken Leg",in_patient: true)
    @patient_2 = @hospital.patients.create!(name: "Vanessa", age: 23, ailment: "Broken Arm",in_patient: true)
    @patient_3 = @hospital.patients.create!(name: "Eric", age: 2, ailment: "Common Cold",in_patient: false)
  end 

  describe "index" do 
    it "lists all of a patients necessary attributes" do 
      visit "/patients"

      expect(page).to have_content(@patient_1.name)
      expect(page).to have_content(@patient_1.age)
      expect(page).to have_content(@patient_1.ailment)
      expect(page).to have_content(@patient_1.in_patient)
    end

    it "only displays patients that have 'true' as a value for in_patient" do 
      visit "/patients"
      
      expect(page).to have_content(@patient_1.name)
      expect(page).to_not have_content(@patient_3.name)
    end

    it "has a link that goes to view that particular patient" do 
      visit "/patients"
      click_link "Go to Patient Jeff"
      
      expect(current_path).to eq("/patients/#{@patient_1.id}")
    end
    
    it "has a link that goes to edit the patients data" do 
      visit "/patients"
      click_link "Edit Patient Jeff Data"

      expect(current_path).to eq("/patients/#{@patient_1.id}/edit")
    end

    it "has a link to delete the patients" do 
      visit "/patients"

      expect(page).to have_content("Jeff")
      expect(page).to have_content("Vanessa")

      click_button("Delete Jeff")
      expect(current_path).to eq("/patients")

      expect(page).to_not have_content("Jeff")
      expect(page).to have_content("Vanessa")
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