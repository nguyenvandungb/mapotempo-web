class AlterTableCustomerAddPrintBarcode < ActiveRecord::Migration
  def change
    add_column :customers, :print_barcode, :string
  end
end
