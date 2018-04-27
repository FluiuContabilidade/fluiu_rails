class AddInvoiceFileToInvoices < ActiveRecord::Migration[5.1]
  def change
    add_column :invoices, :invoice_file, :string
  end
end
