class RenameSpeedMultiplier < ActiveRecord::Migration
  def change
    rename_column :customers, :speed_multiplicator, :speed_multiplier
    rename_column :vehicles, :speed_multiplicator, :speed_multiplier
    rename_column :zones, :speed_multiplicator, :speed_multiplier
  end
end
