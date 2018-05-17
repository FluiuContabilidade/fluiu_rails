class Appointment < ApplicationRecord

  enum owner: [ :client, :agent ], _suffix: true

end
