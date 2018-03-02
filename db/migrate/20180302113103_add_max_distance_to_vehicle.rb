class AddMaxDistanceToVehicle < ActiveRecord::Migration
  def change
    add_column :vehicles, :max_distance, :integer, default: nil
  end
end
