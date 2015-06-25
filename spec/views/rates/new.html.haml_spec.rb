require 'rails_helper'

RSpec.describe "rates/new", type: :view do
  before(:each) do
    assign(:rate, Rate.new(
      :user_id => 1,
      :blueberry => 1.5,
      :raspberry => 1.5,
      :blackberry => 1.5,
      :hour => 1.5,
      :food => 1.5
    ))
  end

  it "renders new rate form" do
    render

    assert_select "form[action=?][method=?]", rates_path, "post" do

      assert_select "input#rate_user_id[name=?]", "rate[user_id]"

      assert_select "input#rate_blueberry[name=?]", "rate[blueberry]"

      assert_select "input#rate_raspberry[name=?]", "rate[raspberry]"

      assert_select "input#rate_blackberry[name=?]", "rate[blackberry]"

      assert_select "input#rate_hour[name=?]", "rate[hour]"

      assert_select "input#rate_food[name=?]", "rate[food]"
    end
  end
end
