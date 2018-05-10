class Appointment < ApplicationRecord
  enum item_type: [ :client, :agent ], _suffix: true

end
