class HospitalsController < ApplicationController
  def index
    @hospitals = Hospital.all
  end

  def show 
    @hospital = Hospital.find(params[:id])
  end

  def show_patients
    @patient = Patient.joins(:hospital).where("hospital_id = ?", params[:id])
    # require 'pry';binding.pry
  end
end