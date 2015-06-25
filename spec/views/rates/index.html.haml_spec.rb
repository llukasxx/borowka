require 'rails_helper'

RSpec.describe "rates/index", type: :view do
  before(:each) do
    assign(:rates, [
      Rate.create!(
        :user_id => 1,
        :blueberry => 1.5,
        :raspberry => 1.5,
        :blackberry => 1.5,
        :hour => 1.5,
        :food => 1.5
      ),
      Rate.create!(
        :user_id => 1,
        :blueberry => 1.5,
        :raspberry => 1.5,
        :blackberry => 1.5,
        :hour => 1.5,
        :food => 1.5
      )
    ])
  end

  it "renders a list of rates" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
  end
end
