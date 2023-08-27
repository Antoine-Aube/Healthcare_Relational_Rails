require 'rails_helper' 

RSpec.describe "Hospitals New" do 
  describe "create a new hospital form" do 
    it "does not have any hospitals created prior" do 
      visit "/hospitals/new"
      
      expect(Hospital.all).to eq([])
    end
    
    it "has a form with necessary fields to create a hospital" do 
      visit "/hospitals/new"
      
      expect(page).to have_content("Enter information for a new Hospital")
      expect(page).to have_field("hospital[name]")
      expect(page).to have_field("hospital[rating]")
      expect(page).to have_unchecked_field("hospital[trauma]")
      expect(page).to have_unchecked_field("hospital[research]")
    end 
    
    it "accepts user input and creates a new hospital" do 
      visit "/hospitals/new"

      fill_in("hospital[name]", with: "St. Mary's")
      fill_in("hospital[rating]", with: 4)
      check("hospital[trauma]")
      check("hospital[research]")

      click_button("submit")

      expect(current_path).to eq("/hospitals")

      expect(Hospital.all.count).to eq(1)
    end
  end
end