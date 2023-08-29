require "rails_helper"

RSpec.describe "Hospitals Index" do 
  before :each do 
    @hospital_1 = Hospital.create!(name: "St. Mary's", rating: 4, trauma: true, research: false)
    @patient_1 = @hospital_1.patients.create(name: "Jeff", age: 17, ailment: "Broken Leg",in_patient: false)
    @patient_2 = @hospital_1.patients.create(name: "Ted", age: 12, ailment: "Broken Face",in_patient: true)
    @patient_3 = @hospital_1.patients.create!(name: "Carla", age: 36, ailment: "Broken Face",in_patient: true)
    @hospital_2 = Hospital.create!(name: "Intermountain", rating: 5, trauma: true, research: false, created_at: 1.day.ago)
    @patient_4 = @hospital_2.patients.create!(name: "Amanda", age: 23, ailment: "Broken Toe",in_patient: true)
    @hospital_3 = Hospital.create!(name: "University Hospital", rating: 5, trauma: true, research: true, created_at: 2.days.ago)
  end

  describe "#index" do 
    it "shows the hospital name" do 
      visit "/hospitals"
      
      expect(page).to have_content(@hospital_1.name)
      expect(page).to have_content(@hospital_2.name)
      expect(page).to have_content(@hospital_3.name)
    end 
    
    it "has the creation date of the hospital along with each hospital name" do 
      visit "/hospitals"
        
      expect(page).to have_content(@hospital_1.created_at)
      expect(page).to have_content(@hospital_2.created_at)
      expect(page).to have_content(@hospital_3.created_at)
    end

    it "sorts hospitals on the page with most recently created appearing first" do 
      visit "/hospitals"

      expect(@hospital_1.name).to appear_before(@hospital_2.name)
      expect(@hospital_2.name).to appear_before(@hospital_3.name)
    end

    it "sorts hospitals on the page by number of patients" do 
      visit "/hospitals"

      click_link "Sort Hospitals by Patient Count"

      expect(@hospital_1.name).to appear_before(@hospital_2.name)
      expect(@hospital_2.name).to appear_before(@hospital_3.name)
      
    end
    
    it "has a page title of Hospitals Index" do 
      visit "/hospitals"
      
      expect(page).to have_content("Hospitals Index")
    end

    it "has a link to create a new hospital" do 
      visit "/hospitals"

      click_link "Create New Hospital"
      expect(current_path).to eq("/hospitals/new")
    end

    it "has a link to delete each hospital" do 
      visit "/hospitals"

      expect(page).to have_content("St. Mary's")
      expect(page).to have_content("Intermountain")

      click_button("Delete St. Mary's")
      expect(current_path).to eq("/hospitals")

      expect(page).to_not have_content("St. Mary's")
      expect(page).to have_content("Intermountain")
    end

    it "has a link to edit hospital data for each hospital" do 
      visit "/hospitals"

      click_link "Edit St. Mary's Data"
      expect(current_path).to eq("/hospitals/#{@hospital_1.id}/edit")
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