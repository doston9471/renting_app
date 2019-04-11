class AddStatusToRenters < ActiveRecord::Migration[5.2]
  def change
    add_column :renters, :status, :integer, default: 0
  end
end
