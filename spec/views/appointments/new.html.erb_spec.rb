require 'rails_helper'

RSpec.describe "appointments/new", type: :view do
  before(:each) do
    assign(:appointment, Appointment.new(
      :item_date => "MyString",
      :item_type => 1,
      :item_description => "MyString"
    ))
  end

  it "renders new appointment form" do
    render

    assert_select "form[action=?][method=?]", appointments_path, "post" do

      assert_select "input[name=?]", "appointment[item_date]"

      assert_select "input[name=?]", "appointment[item_type]"

      assert_select "input[name=?]", "appointment[item_description]"
    end
  end
end
