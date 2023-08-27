require "rails_helper"

RSpec.describe "Hospitals Edit" do 
  before :each do 
   @hospital = Hospital.create!(name: "St. Mary's", rating: 4, trauma: true, research: true)
  #  @patient = @hospital.patients.create!(name: "Jeff", age: 44, ailment: "Broken Leg",in_patient: true)
  #  @patient_2 = @hospital.patients.create!(name: "Lucy", age: 12, ailment: "Runny nose",in_patient: false)
 end

 describe "when I visit '/hospitals/hospital.id/edit" do 
  it "has fields to edit the hospital selected with pre-populated content" do 
    visit "/hospitals/#{@hospital.id}/edit"
    expect(page).to have_content("Edit St. Mary's Data")
    expect(page).to have_field("hospital[name]", with: "St. Mary's")
    expect(page).to have_field("hospital[rating]", with: 4)
    expect(page).to have_checked_field("hospital[trauma]")
    expect(page).to have_checked_field("hospital[research]")

    expect(page).to have_button("submit")

    click_button "submit"

    expect(current_path).to eq("/hospitals/#{@hospital.id}")
  end

  it "can edit fields with new content that then render on '/hospitals/hospital.id' page" do
    visit "/hospitals/#{@hospital.id}/edit"

    fill_in("hospital[name]", with: "St. David's")
    fill_in("hospital[rating]", with: 3)
    uncheck("hospital[trauma]")
    uncheck("hospital[research]")

    click_button "submit"
  
    expect(current_path).to eq("/hospitals/#{@hospital.id}")
    expect(page).to have_content("St. David's")
    expect(page).to have_content(3)
    expect(page).to have_content("false")
  end
 end
end 