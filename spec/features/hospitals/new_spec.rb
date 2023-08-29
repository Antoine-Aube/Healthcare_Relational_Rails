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
      expect(page).to have_field(:name)
      expect(page).to have_field(:rating)
      expect(page).to have_unchecked_field(:trauma)
      expect(page).to have_unchecked_field(:research)
    end 
    
    it "accepts user input and creates a new hospital" do 
      visit "/hospitals/new"

      fill_in(:name, with: "Intermountain")
      fill_in(:rating, with: 4)
      check(:trauma)
      check(:research)

      click_button("Submit")

      expect(current_path).to eq("/hospitals")

      expect(Hospital.all.count).to eq(1)
      expect(page).to have_content("Intermountain")
    end
  end
end