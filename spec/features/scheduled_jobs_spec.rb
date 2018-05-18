require 'rails_helper'
require "rake"
Rails.application.load_tasks

describe 'task: event_notice' do

  it "notifies users successfully" do
    for i in 1..3
      user = FactoryBot.build(:user)
      user.confirm
    end

    allow(Time).to receive(:now).and_return(Time.new(2018, 10, 10))
    appointment = FactoryBot.create(:appointment, day: '15')
    expect { Rake::Task['event_notice'].invoke }.to change { ActionMailer::Base.deliveries.count }.by(3)

  end

end
