class AddFields2ToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :earnings_type, :string
    add_column :users, :earnings_range, :string
  end
end
