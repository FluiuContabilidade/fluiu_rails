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
  

end
