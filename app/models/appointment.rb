class Appointment < ApplicationRecord
  enum item_type: [ :client, :agent ], _suffix: true


  def self.get_monthly_events month


  end



end
