class AddAccInfoReferenceToInvoice < ActiveRecord::Migration[5.1]
  def change
    add_reference :invoices, :accounting_info, foreign_key: true
  end
end
