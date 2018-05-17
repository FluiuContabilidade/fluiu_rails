class AddProtocolFileToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :protocol, :string
  end
end
