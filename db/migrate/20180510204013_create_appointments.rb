class CreateAppointments < ActiveRecord::Migration[5.1]
  def change
    create_table :appointments do |t|
      t.string :item_date
      t.integer :item_type
      t.string :item_description

      t.timestamps
    end
  end
end
