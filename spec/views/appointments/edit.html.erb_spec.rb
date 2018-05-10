require 'rails_helper'

RSpec.describe "appointments/edit", type: :view do
  before(:each) do
    @appointment = assign(:appointment, Appointment.create!(
      :item_date => "MyString",
      :item_type => 1,
      :item_description => "MyString"
    ))
  end

  it "renders the edit appointment form" do
    render

    assert_select "form[action=?][method=?]", appointment_path(@appointment), "post" do

      assert_select "input[name=?]", "appointment[item_date]"

      assert_select "input[name=?]", "appointment[item_type]"

      assert_select "input[name=?]", "appointment[item_description]"
    end
  end
end
