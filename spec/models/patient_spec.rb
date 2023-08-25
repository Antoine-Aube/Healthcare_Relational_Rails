require "rails_helper"

RSpec.describe Patient, type: :model do 
  let(:patient_1) {Patient.new}

  describe "relationships" do 
    it{should belong_to :hospital}
  end

  describe "validations" do 
    it{should validate_presence_of(:name)}
    it{should validate_presence_of(:age)}
    it{should validate_presence_of(:ailment)}
    it{should allow_value(true).for(:in_patient)}
    it{should allow_value(false).for(:in_patient)}
  end
  
  describe "Initialize" do
    it{expect(patient_1).to be_a Patient}
  end
end