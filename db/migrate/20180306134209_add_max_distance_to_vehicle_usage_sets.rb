class AddMaxDistanceToVehicleUsageSets < ActiveRecord::Migration
  def change
    add_column :vehicle_usage_sets, :max_distance, :integer, default: nil
  end
end
