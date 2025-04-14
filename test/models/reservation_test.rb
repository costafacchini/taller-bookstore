require "test_helper"

class ReservationTest < ActiveSupport::TestCase
  context "#borrowed_at" do
    should validate_presence_of(:borrowed_at)
  end
end
