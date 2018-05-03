class AddUserFilesToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :patrimonial_balance, :string
    add_column :users, :dre_file, :string
    add_column :users, :social_contract, :string
    add_column :users, :business_licence, :string
    add_column :users, :cnpj_file, :string
    add_column :users, :cf_file, :string
    add_column :users, :personal_file, :string
  end
end
