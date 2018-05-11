require 'rails_helper'

RSpec.describe Appointment, type: :model do

  describe '.is_valid_for_month?' do
    it 'returns true if does not have \'/\' on date string and its a valid day for the month' do
      month = '02'
      a1 = FactoryBot.create(:appointment, item_date: '06')
      a3 = FactoryBot.create(:appointment, item_date: '30')
      expect(a1.is_valid_for_month? month).to be(true)
      expect(a3.is_valid_for_month? month).to be(false)
    end

    it 'returns true if has / but has month present ' do
      month = '02'
      a1 = FactoryBot.create(:appointment, item_date: '06/02')
      a2 = FactoryBot.create(:appointment, item_date: '30/02')
      a3 = FactoryBot.create(:appointment, item_date: '05/01,05,06')
      a4 = FactoryBot.create(:appointment, item_date: '05/02,08,12')
      expect(a1.is_valid_for_month? month).to be(true)
      expect(a2.is_valid_for_month? month).to be(false)
      expect(a3.is_valid_for_month? month).to be(false)
      expect(a4.is_valid_for_month? month).to be(true)
    end

    it 'returns false otherwise' do
      a1 = FactoryBot.create(:appointment, item_date: 'this date does not makes sense')
      expect(a1.is_valid_for_month? '02').to be(false)
    end

  end

  describe '.get_monthly_events' do

    before :each do
      @events = [FactoryBot.create(:appointment, item_date: '02'), FactoryBot.create(:appointment, item_date: '03'),
      FactoryBot.create(:appointment, item_date: '04/02'), FactoryBot.create(:appointment, item_date: '05/02'),
      FactoryBot.create(:appointment, item_date: '06/03'), FactoryBot.create(:appointment, item_date: '33'),
      FactoryBot.create(:appointment, item_date: '07/01,03,05'), FactoryBot.create(:appointment, item_date: '08/02,07,12'),
      FactoryBot.create(:appointment, item_date: 'this item_date does not make any sense.') ]
    end

    it 'returns events that are happening this month' do
      month = '02'
      expect(Appointment.get_monthly_events month).to eq([@events[0], @events[1], @events[2], @events[3], @events[7]])
    end

    it 'does not returns events not included in month' do
      month = '02'
      expect(Appointment.get_monthly_events month).not_to include(@events[4])
      expect(Appointment.get_monthly_events month).not_to include(@events[5])
      expect(Appointment.get_monthly_events month).not_to include(@events[6])
      expect(Appointment.get_monthly_events month).not_to include(@events[8])
    end
  end

end
