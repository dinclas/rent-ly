class CreateVehicles < ActiveRecord::Migration[6.0]
  def change
    create_table :vehicles do |t|
      t.string :model
      t.string :brand
      t.string :plate
      t.integer :model_year
      t.integer :manufacture_year

      t.timestamps
    end
  end
end
