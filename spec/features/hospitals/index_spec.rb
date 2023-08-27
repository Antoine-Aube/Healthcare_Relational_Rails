require "rails_helper"

RSpec.describe "Hospitals Index" do 
  before :each do 
    @hospital_1 = Hospital.create!(name: "St. Mary's", rating: 4, trauma: true, research: false)
    @hospital_2 = Hospital.create!(name: "Intermountain", rating: 5, trauma: true, research: false, created_at: 1.day.ago)
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
    
    it "has a page title of Hospitals Index" do 
      visit "/hospitals"
      
      expect(page).to have_content("Hospitals Index")
    end

    it "has a link to create a new hospital" do 
      visit "/hospitals"

      click_link "Create New Hospital"
      expect(current_path).to eq("/hospitals/new")
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