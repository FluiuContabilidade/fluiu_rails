require 'rails_helper'
require "cancan/matchers"

describe 'User abilities' do

  context 'when user role is Admin' do
      before :each do
        user = FactoryBot.build(:user, role: 'admin')
        user.confirm
        @ability = Ability.new(user)
      end

      it "is able to manage Users" do
        # @ability.should be_able_to(:manage, User)
        expect(@ability).to be_able_to(:manage, User)
      end

      it "is able to manage Appointments" do
        expect(@ability).to be_able_to(:manage, Appointment)
      end

  end


end