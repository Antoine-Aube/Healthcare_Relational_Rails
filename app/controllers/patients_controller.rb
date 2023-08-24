class PatientsController < ApplicationController
  def index
    @patients = Patient.all
  end

  def show
    @patient = Patient.find(params[:id])
  end

  def edit
    @patient = Patient.find(params[:id])
    if @patient.in_patient == true
      @in_patient = "checked"
    else
      @in_patient = nil
    end
  end

  def update
    patient = Patient.find(params[:id])
    patient.update({
      name: params[:patient][:name],
      age: params[:patient][:age],
      ailment: params[:patient][:ailment],
      in_patient: (params[:patient][:in_patient] || false)
    })
    patient.save

    redirect_to "/patients/#{patient.id}"
  end
end