class AddForeignKeyToPatients < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :patients, :hospitals, column: :hospital_id
  end
end
