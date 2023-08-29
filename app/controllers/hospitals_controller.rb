class HospitalsController < ApplicationController
  
  def index
    @hospitals = Hospital.order_by_creation
      if params[:sortedpatients] == "true"
        @hospitals = Hospital.order_by_patient_count
      else [:exact] != nil
        @hospitals = Hospital.exact_search(params[:exact])
      end
  end

  def show 
    @hospital = Hospital.find(params[:id])
  end

  def new

  end

  def create
    hospital = Hospital.new({
      name: params[:name],
      rating: params[:rating],
      trauma: params[:trauma],
      research: params[:research]
    })

    hospital.save

    redirect_to "/hospitals"
  end

  def edit
    @hospital = Hospital.find(params[:id])
  end
  
  def update
    hospital = Hospital.find(params[:id])
    hospital.update({
      name: params[:name],
      rating: params[:rating],
      trauma: (params[:trauma] || false),
      research: (params[:research] || false)
    })
    hospital.save

    redirect_to "/hospitals/#{hospital.id}"
  end

  def destroy
    @hospital = Hospital.destroy(params[:id])
    redirect_to '/hospitals'
  end
end