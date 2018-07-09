class AddNameAndSysIdToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :sys_id, :string
  end
end
