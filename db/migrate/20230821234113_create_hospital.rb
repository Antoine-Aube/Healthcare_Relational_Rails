class CreateHospital < ActiveRecord::Migration[7.0]
  def change
    create_table :hospitals do |t|
      t.string :name
      t.integer :rating
      t.boolean :trauma
      t.boolean :research

      t.timestamps
    end
  end
end
