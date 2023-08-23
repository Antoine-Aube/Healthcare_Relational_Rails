class AddHospitalIdtoPatients < ActiveRecord::Migration[7.0]
  def change
    add_column :patients, :hospital_id, :bigint
  end
end
