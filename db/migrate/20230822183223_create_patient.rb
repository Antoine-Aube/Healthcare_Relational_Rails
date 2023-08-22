class CreatePatient < ActiveRecord::Migration[7.0]
  def change
    create_table :patients do |t|
      t.string :name
      t.integer :age
      t.string :ailment
      t.boolean :in_patient

      t.timestamps
    end
  end
end
