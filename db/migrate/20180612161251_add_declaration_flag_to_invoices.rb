class AddDeclarationFlagToInvoices < ActiveRecord::Migration[5.1]
  def change
    add_column :invoices, :declaration_flag, :boolean
  end
end
