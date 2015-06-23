require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do

    it "should be valid" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "should be invalid" do
      user = build(:user, firstname: "")
      expect(user).not_to be_valid
    end

  end

end
