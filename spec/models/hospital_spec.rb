require "rails_helper"

RSpec.describe Hospital, type: :model do 
  let(:hospital_1) {Hospital.new}

  describe "Initialize" do 
    it{expect(hospital_1).to be_a Hospital}
  end
end