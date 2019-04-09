class AddExtraFieldsToRenter < ActiveRecord::Migration[5.2]
  def change
    add_column :renters, :middle_name, :string
    add_column :renters, :passport, :string
    add_column :renters, :address, :string
    add_column :renters, :registration, :string
    add_column :renters, :fact_address, :string
    add_column :renters, :deposit, :decimal
  end
end
