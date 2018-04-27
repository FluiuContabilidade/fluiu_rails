class AddFieldsToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :company, :string
    add_column :users, :cnpj, :string
    add_column :users, :cpf, :string
    add_column :users, :telephone, :string
  end
end
