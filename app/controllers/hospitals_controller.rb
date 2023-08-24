class HospitalsController < ApplicationController
  def index
    @hospitals = Hospital.order("created_at desc")
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
end