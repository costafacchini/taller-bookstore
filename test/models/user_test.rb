require "test_helper"

class UserTest < ActiveSupport::TestCase
  context "#name" do
    should validate_presence_of(:name)
  end

  context "#email" do
    should validate_presence_of(:email)
  end
end
