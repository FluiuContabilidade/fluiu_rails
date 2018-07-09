require 'rails_helper'

describe 'visits application pages' do

  before :each do
    @user = FactoryBot.build(:user, role: 'admin')
    @user.confirm
    login_as(@user, :scope => :user)
  end

  it "visits events page" do
    visit '/events'
    expect(page).to have_content 'Responsabilidades Fluiu'
  end

  # it "visits remind not sent users route" do
  #   user = FactoryBot.build(:user, role: 'client')
  #   user.confirm
  #   visit '/agent/fiscal/remind_not_sent_users'
  #   x = ActionMailer::Base.deliveries.count
  #   byebug
  #
  #   expect{   visit '/agent/fiscal/remind_not_sent_users' }.to change { ActionMailer::Base.deliveries.count }.by(1)
  # end

end
