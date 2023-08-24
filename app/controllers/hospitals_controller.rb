class HospitalsController < ApplicationController
  def index
    @hospitals = Hospital.order("created_at desc")
  end

  def show 
    @hospital = Hospital.find(params[:id])
  end
end