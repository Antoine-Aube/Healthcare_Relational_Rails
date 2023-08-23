require "rails_helper"

RSpec.describe Patient, type: :model do 
  let(:patient_1) {Patient.new}
  
  describe "Initialize" do
    it{expect(patient_1).to be_a Patient}
  end
end