require 'rails_helper'

RSpec.describe Appointment, type: :model do

  describe '.get_ordered_monthly_events' do

    before :each do
      @events = [FactoryBot.create(:appointment, date: '02'), FactoryBot.create(:appointment, date: '03'),
      FactoryBot.create(:appointment, date: '04/02'), FactoryBot.create(:appointment, date: '05/02'),
      FactoryBot.create(:appointment, date: '06/03'), FactoryBot.create(:appointment, date: '33'),
      FactoryBot.create(:appointment, date: '07/01,03,05'), FactoryBot.create(:appointment, date: '08/02,07,12') ]
    end

    it 'returns events that are happening this month' do

    end

    it 'does not returns events from days that the month does not have' do

    end

    it 'does not return events where months are specified' do
    end

  end


end
