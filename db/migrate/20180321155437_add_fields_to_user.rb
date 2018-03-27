class AddFieldsToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :company, :string
    add_column :users, :cnpj, :integer
    add_column :users, :cpf, :integer
    add_column :users, :telephone, :integer
  end
end
