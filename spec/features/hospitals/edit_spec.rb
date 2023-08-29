require "rails_helper"

RSpec.describe "Hospitals Edit" do 
  before :each do 
   @hospital = Hospital.create!(name: "St. Mary's", rating: 4, trauma: true, research: true)
 end

 describe "when I visit '/hospitals/hospital.id/edit" do 
  it "has fields to edit the hospital selected with pre-populated content" do 
    visit "/hospitals/#{@hospital.id}/edit"
    expect(page).to have_content("Edit St. Mary's Data")
    expect(page).to have_field(:name, with: "St. Mary's")
    expect(page).to have_field(:rating, with: 4)
    expect(page).to have_checked_field(:trauma)
    expect(page).to have_checked_field(:research)

    expect(page).to have_button("Submit")

    click_button "Submit"

    expect(current_path).to eq("/hospitals/#{@hospital.id}")
  end

  it "can edit fields with new content that then render on '/hospitals/hospital.id' page" do
    visit "/hospitals/#{@hospital.id}/edit"

    fill_in(:name, with: "St. David's")
    fill_in(:rating, with: 3)
    uncheck(:trauma)
    uncheck(:research)

    click_button "Submit"
  
    expect(current_path).to eq("/hospitals/#{@hospital.id}")
    expect(page).to have_content("St. David's")
    expect(page).to have_content(3)
    expect(page).to have_content("false")
  end
 end
end 