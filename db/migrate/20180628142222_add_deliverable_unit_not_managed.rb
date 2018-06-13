class AddDeliverableUnitNotManaged < ActiveRecord::Migration
  def change
    add_column :stops, :unmanageable_capacity, :boolean
  end
end
