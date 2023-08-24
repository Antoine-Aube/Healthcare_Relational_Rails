class HospitalPatientsController < ApplicationController
  def index
    @hospital = Hospital.find(params[:id])
  end

  def new
    @hospital = Hospital.find(params[:id])
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