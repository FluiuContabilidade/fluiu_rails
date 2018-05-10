require 'rails_helper'

RSpec.describe "appointments/show", type: :view do
  before(:each) do
    @appointment = assign(:appointment, Appointment.create!(
      :item_date => "Item Date",
      :item_type => 2,
      :item_description => "Item Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Item Date/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Item Description/)
  end
end
