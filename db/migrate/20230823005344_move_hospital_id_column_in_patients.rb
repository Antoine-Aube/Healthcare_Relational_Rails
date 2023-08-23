class MoveHospitalIdColumnInPatients < ActiveRecord::Migration[7.0]
  def change
    change_column :patients, :hospital_id, :bigint, after: :id
  end
end
