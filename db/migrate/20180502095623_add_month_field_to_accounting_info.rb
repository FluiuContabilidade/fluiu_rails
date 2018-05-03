class AddMonthFieldToAccountingInfo < ActiveRecord::Migration[5.1]
  def change
    add_column :accounting_infos, :month, :string
  end
end
