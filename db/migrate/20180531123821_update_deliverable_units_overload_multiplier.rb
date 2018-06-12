class UpdateDeliverableUnitsOverloadMultiplier < ActiveRecord::Migration
  def self.up
    DeliverableUnit.where(optimization_overload_multiplier: -1).update_all(optimization_overload_multiplier: nil)
  end
end
