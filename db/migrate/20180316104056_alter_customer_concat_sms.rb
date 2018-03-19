class AlterCustomerConcatSms < ActiveRecord::Migration
  def change
    add_column :customers, :sms_concat, :boolean, default: false, null: false
    add_column :customers, :sms_from_customer_name, :boolean, default: false, null: false
  end
end
