require 'rails_helper'

RSpec.describe "rates/edit", type: :view do
  before(:each) do
    @rate = assign(:rate, Rate.create!(
      :user_id => 1,
      :blueberry => 1.5,
      :raspberry => 1.5,
      :blackberry => 1.5,
      :hour => 1.5,
      :food => 1.5
    ))
  end

  it "renders the edit rate form" do
    render

    assert_select "form[action=?][method=?]", rate_path(@rate), "post" do

      assert_select "input#rate_user_id[name=?]", "rate[user_id]"

      assert_select "input#rate_blueberry[name=?]", "rate[blueberry]"

      assert_select "input#rate_raspberry[name=?]", "rate[raspberry]"

      assert_select "input#rate_blackberry[name=?]", "rate[blackberry]"

      assert_select "input#rate_hour[name=?]", "rate[hour]"

      assert_select "input#rate_food[name=?]", "rate[food]"
    end
  end
end
