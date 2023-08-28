class HospitalsController < ApplicationController
  
  def index
    @hospitals = Hospital.all.order_by_creation 
  end

  def show 
    @hospital = Hospital.find(params[:id])
  end

  def new

  end

  def create
    hospital = Hospital.new({
      name: params[:hospital][:name],
      rating: params[:hospital][:rating],
      trauma: (params[:hospital][:trauma] || false),
      research: (params[:hospital][:research] || false)
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
      name: params[:hospital][:name],
      rating: params[:hospital][:rating],
      trauma: (params[:hospital][:trauma] || false),
      research: (params[:hospital][:research] || false)
    })
    hospital.save

    redirect_to "/hospitals/#{hospital.id}"
  end

  def destroy
    @hospital = Hospital.destroy(params[:id])
    redirect_to '/hospitals'
  end
end