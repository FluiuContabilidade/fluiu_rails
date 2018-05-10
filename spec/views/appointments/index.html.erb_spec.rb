require 'rails_helper'

RSpec.describe "appointments/index", type: :view do
  before(:each) do
    assign(:appointments, [
      Appointment.create!(
        :item_date => "Item Date",
        :item_type => 2,
        :item_description => "Item Description"
      ),
      Appointment.create!(
        :item_date => "Item Date",
        :item_type => 2,
        :item_description => "Item Description"
      )
    ])
  end

  it "renders a list of appointments" do
    render
    assert_select "tr>td", :text => "Item Date".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Item Description".to_s, :count => 2
  end
end
