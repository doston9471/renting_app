class CreateRenters < ActiveRecord::Migration[5.2]
  def change
    create_table :renters do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :email
      t.references :car, foreign_key: true

      t.timestamps
    end
  end
end
