require "rails_helper"

RSpec.describe "Hospitals Index" do 
  describe "#show" do 
    it "shows the hospital attributes" do 
      hospital = Hospital.create!(name: "St. Mary's", rating: 4, trauma: true, research: false)
      
      visit "/hospitals/#{hospital.id}"
      
      expect(page).to have_content(hospital.name)
      expect(page).to have_content(hospital.rating)
      expect(page).to have_content(hospital.trauma)
      expect(page).to have_content(hospital.research)
    end 
    
    it "has a link to the hospitals patients list" do 
      hospital = Hospital.create!(name: "St. Mary's", rating: 4, trauma: true, research: false)
      visit "/hospitals/#{hospital.id}"
      
      click_link "#{hospital.name} patients"
      
      expect(current_path).to eq("/hospitals/#{hospital.id}/patients")
    end
    
    it "has the hospital name as the page header" do 
      hospital = Hospital.create!(name: "St. Mary's", rating: 4, trauma: true, research: false)
      visit "/hospitals/#{hospital.id}"


      expect(page).to have_content(hospital.name)
    end
  end
end 