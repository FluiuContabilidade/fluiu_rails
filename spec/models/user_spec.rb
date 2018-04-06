require 'rails_helper'

RSpec.describe User, type: :model do

  it "creates with valid attributes" do
    user = FactoryBot.build(:user)
    expect(user).to be_valid
  end

  it "doesn't create with invalid attributes" do
    user = FactoryBot.build(:user, email: 'invalidemailaddress')
    expect(user).to_not be_valid
  end

  it "sucessfully returns user invoice months" do
    invoices = [FactoryBot.build(:invoice, month: '01-2018'), FactoryBot.build(:invoice, month: '02-2018'), FactoryBot.build(:invoice, month: '03-2018')]
    user = FactoryBot.build(:user, invoices: invoices)
    expect(user.user_invoice_months).to eq(['01-2018', '02-2018', '03-2018'])
  end


end
