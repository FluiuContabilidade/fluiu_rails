class AddDasFileToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :das_file, :string
  end
end
