class Appointment < ApplicationRecord
  enum item_type: [ :client, :agent ], _suffix: true


  def self.get_monthly_events month
    appointments = []
    Appointment.all.each do |a|
      appointments.push(a) if a.is_valid_for_month?(month)
    end

    return appointments
  end

  def is_valid_for_month? month
    require 'date'
    return false if !(Date.valid_date?( DateTime.now.year , month.to_i, item_date[0..1].to_i ))
    if item_date.include? '/'
      dates = item_date.split('/')
      if dates.length < 2
        return false
      else
        dates = dates[1].split(',')
        dates.each do |d|
          return true if d.to_i == month.to_i
        end
        return false
      end
    else
      return true
    end
  end


end
