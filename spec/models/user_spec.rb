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

  describe ".user_invoice_months" do
    it "returns months of which user has invoices" do
      invoices = [FactoryBot.build(:invoice, month: '01-2018'), FactoryBot.build(:invoice, month: '02-2018'), FactoryBot.build(:invoice, month: '03-2018')]
      user = FactoryBot.build(:user, invoices: invoices)
      expect(user.user_invoice_months).to eq(['01-2018', '02-2018', '03-2018'])
    end
  end

  describe '.get_company_tax_percentage' do
    it "returns tax percent" do
      user = FactoryBot.build(:user)
      expect(user.get_company_tax_percentage).to eq(0.04)
    end
  end

  describe '.has_month_invoices?' do
    before :each do
      invoices = [FactoryBot.build(:invoice, month: '01-2018'), FactoryBot.build(:invoice, month: '02-2018'), FactoryBot.build(:invoice, month: '03-2018')]
      @user = FactoryBot.build(:user, invoices: invoices)
    end

    it "returns true if user did not sent monthly invoices" do3
      current_month = '2018-05'
      expect(@user.has_month_invoices?(current_month)).to be(false)
    end

    it "returns false if user sent monthly invoices" do
      current_month = '02-2018'
      expect(@user.has_month_invoices?(current_month)).to be(true)
    end

    it "returns false if user does not have invoices" do
      user = FactoryBot.build(:user)
      expect(user.has_month_invoices?('any_date')).to be(false)
    end
  end


  ## Added specs for method User.request_opening_status_change @ 01/06/2018
  ##
  describe '.request_opening_status_change' do
    it "Sends email when user calls request_opening_status_change method" do
      user = FactoryBot.build(:user)
      expect(user.request_opening_status_change).to change{ActionMailer::Base.deliveries.count}.by(1)
    end
  end


end
