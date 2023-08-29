class HospitalPatientsController < ApplicationController
  def index
    @hospital = Hospital.find(params[:id])
    if params[:sorted] == "true"
      @patients = @hospital.order_patients_alphabetically
    elsif params[:threshold]
      @patients = @hospital.age_threshold(params[:threshold])
    else
      @patients = @hospital.patients
    end
  end

  def new
    @hospital = Hospital.find(params[:id])
  end

  def create
    hospital = Hospital.find(params[:id])
    patient = hospital.patients.create!({
      name: params[:name],
      age: params[:age],
      ailment: params[:ailment],
      in_patient: params[:ailment]
    })

    redirect_to "/hospitals/#{hospital.id}/patients"
  end
end