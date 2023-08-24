class HospitalsController < ApplicationController
  
  def index
    # @hospitals = Hospital.order("created_at desc")
    @hospitals = Hospital.all.order_by
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
    if @hospital.trauma == true
      @trauma = "checked"
    else 
      @trauma = nil
    end

    if @hospital.research == true
      @research = "checked"
    else 
      @research = nil
    end
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
end