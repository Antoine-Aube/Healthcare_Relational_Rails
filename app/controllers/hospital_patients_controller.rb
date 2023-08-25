class HospitalPatientsController < ApplicationController
  def index
    @hospital = Hospital.find(params[:id])
    # require 'pry';binding.pry
    if params[:sorted] == "true"
      @hospital = Hospital.find(params[:id])
      # require 'pry';binding.pry
      @patients = @hospital.order_patients_alphabetically
    elsif params[:threshold]
      @patients = @hospital.adult_patients(params[:threshold])
    else
      @hospital = Hospital.find(params[:id])
      @patients = @hospital.patients
    end
    
    
  end

  def new
    @hospital = Hospital.find(params[:id])
  end

  def ordered_show
    @hospital = Hospital.find(params[:id])
    @patients = @hospital.order_patients_alphabetically
  end

  def create
    hospital = Hospital.find(params[:id])
    patient = hospital.patients.create!({
      name: params[:patient][:name],
      age: params[:patient][:age],
      ailment: params[:patient][:ailment],
      in_patient: params[:patient][:ailment]
    })

    redirect_to "/hospitals/#{hospital.id}/patients"
  end
end