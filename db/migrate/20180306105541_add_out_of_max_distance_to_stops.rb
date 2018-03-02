class AddOutOfMaxDistanceToStops < ActiveRecord::Migration
  def change
    add_column :stops, :out_of_max_distance, :boolean
  end
end
