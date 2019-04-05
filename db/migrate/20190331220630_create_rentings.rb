class CreateRentings < ActiveRecord::Migration[5.2]
  def change
    create_table :rentings do |t|
      t.decimal :expense
      t.decimal :income
      t.decimal :total
      t.datetime :payment_date
      t.references :car, foreign_key: true
      t.references :renter, foreign_key: true

      t.timestamps
    end
  end
end
