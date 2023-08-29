class PatientsController < ApplicationController
  def index
    @patients = Patient.in_patient?
  end

  def show
    @patient = Patient.find(params[:id])
  end

  def edit
    @patient = Patient.find(params[:id])
  end

  def update
    patient = Patient.find(params[:id])
    patient.update({
      name: params[:name],
      age: params[:age],
      ailment: params[:ailment],
      in_patient: (params[:in_patient] || false)
    })
    patient.save

    redirect_to "/patients/#{patient.id}"
  end

  def destroy
    @patients = Patient.destroy(params[:id])
    redirect_to "/patients"
  end
end