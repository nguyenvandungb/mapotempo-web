class AddStopOutOfMaxDistanceToRoutes < ActiveRecord::Migration
  def change
    add_column :routes, :stop_out_of_max_distance, :boolean
  end
end
