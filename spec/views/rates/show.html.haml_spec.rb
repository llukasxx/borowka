require 'rails_helper'

RSpec.describe "rates/show", type: :view do
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

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/1.5/)
  end
end
