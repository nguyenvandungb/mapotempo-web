class AlterCustomerAddEnableSms < ActiveRecord::Migration
  def change
    add_column :customers, :enable_sms, :boolean, default: false, null: false
    add_column :customers, :sms_template, :string
    add_column :resellers, :sms_api_key, :string
    add_column :resellers, :sms_api_secret, :string
  end
end
