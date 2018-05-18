class AddOwnerToAppointment < ActiveRecord::Migration[5.1]
  def change
    add_column :appointments, :owner, :integer
  end
end
