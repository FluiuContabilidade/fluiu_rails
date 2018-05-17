class AddTaxFilesToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :fgts, :string
    add_column :users, :inss, :string
    add_column :users, :fau, :string
    add_column :users, :tributary_sub, :string
    add_column :users, :payment_installments, :string
  end
end
