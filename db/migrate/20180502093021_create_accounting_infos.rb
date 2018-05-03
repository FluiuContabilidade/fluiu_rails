class CreateAccountingInfos < ActiveRecord::Migration[5.1]
  def change
    create_table :accounting_infos do |t|
      t.string :financial_spreadsheet
      t.string :canceled_invoices
      t.string :paycheck_changes

      t.timestamps
    end
  end
end
