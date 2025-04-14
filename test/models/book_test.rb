require "test_helper"

class BookTest < ActiveSupport::TestCase
  context "#title" do
    should validate_presence_of(:title)
  end

  context "#status" do
    should define_enum_for(:status).with_values([ :available, :reserved ])
  end
end
