class Hospital < ApplicationRecord
  has_many :patients

  def patient_count
    patients.count
  end

  def self.order_by
    Hospital.order("created_at desc")
  end
  
  #A way to give a default ordering
  # default_scope {order("created_at DESC")}
end