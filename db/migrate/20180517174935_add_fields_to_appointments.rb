class AddFieldsToAppointments < ActiveRecord::Migration[5.1]
  def change
    add_column :appointments, :day, :string
    add_column :appointments, :event, :string
  end
end
