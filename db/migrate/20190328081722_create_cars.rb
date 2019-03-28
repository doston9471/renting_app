class CreateCars < ActiveRecord::Migration[5.2]
  def change
    create_table :cars do |t|
      t.string :make
      t.string :model
      t.string :plate
      t.decimal :monthly_rent
      t.decimal :daily_rent

      t.timestamps
    end
  end
end
