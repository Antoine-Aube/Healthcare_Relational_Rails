require "rails_helper"

RSpec.describe "Hospitals Index" do 
  describe "#show" do 
  it "shows the hospital name" do 
    hospital = Hospital.create!(name: "St. Mary's", rating: 4, trauma: true, research: false)
    hospital_2 = Hospital.create!(name: "Intermountain", rating: 5, trauma: true, research: false)
    hospital_3 = Hospital.create!(name: "University Hospital", rating: 5, trauma: true, research: true)
    
      visit "/hospitals"
      
      expect(page).to have_content(hospital.name)
      expect(page).to have_content(hospital_2.name)
      expect(page).to have_content(hospital_3.name)
    end 
    
    it "has a page title of Hospitals Index" do 
      visit "/hospitals"
      
      expect(page).to have_content("Hospitals Index")
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
    
    it "has the creation date of the hospital along with each hospital name" do 
   
      hospital = Hospital.create!(name: "St. Mary's", rating: 4, trauma: true, research: false)
      hospital_2 = Hospital.create!(name: "Intermountain", rating: 5, trauma: true, research: false)
      hospital_3 = Hospital.create!(name: "University Hospital", rating: 5, trauma: true, research: true)
        
      visit "/hospitals"
        
      expect(page).to have_content(hospital.created_at)
      expect(page).to have_content(hospital_2.created_at)
      expect(page).to have_content(hospital_3.created_at)
    end
  end
end