require 'rails_helper' 

RSpec.describe "HospitalPatients New" do 
  before :each do
    @hospital_1 = Hospital.create!(name: "St. Mary's", rating: 4, trauma: true, research: false)
  end
  describe "create a new patients form" do
    it "does not have any hospitals created prior" do 
      visit "/hospitals/#{@hospital_1.id}/patients/new"
      
      expect(@hospital_1.patients).to eq([])
    end
    
    it "has a form with necessary fields to create a hospital" do 
      visit "/hospitals/#{@hospital_1.id}/patients/new"
      
      expect(page).to have_content("Add New Patient to St. Mary's")
      expect(page).to have_field("patient[name]")
      expect(page).to have_field("patient[age]")
      expect(page).to have_field("patient[ailment]")
      expect(page).to have_unchecked_field("patient[in_patient]")
    end 
    
    it "accepts user input and creates a new hospital" do 
      visit "/hospitals/#{@hospital_1.id}/patients/new"

      fill_in("patient[name]", with: "Monica")
      fill_in("patient[age]", with: 4)
      fill_in("patient[ailment]", with: "Whooping Cough")
      check("patient[in_patient]")

      click_button("submit")

      expect(current_path).to eq("/hospitals/#{@hospital_1.id}/patients")

      expect(@hospital_1.patients.count).to eq(1)
      expect(page).to have_content("Monica")
    end
  end
end