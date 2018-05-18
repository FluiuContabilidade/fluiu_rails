class AddOpeningStatusToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :opening_status, :integer
  end
end
