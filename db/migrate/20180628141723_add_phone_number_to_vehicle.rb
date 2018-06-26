class AddPhoneNumberToVehicle < ActiveRecord::Migration
  def change
    add_column :vehicles, :phone_number, :string
  end
end
