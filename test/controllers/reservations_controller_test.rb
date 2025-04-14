require "test_helper"

class ReservationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @reservation = reservations(:one)
  end

  test "should returns a reservation" do
    get reservation_url(@reservation), as: :json
    assert_response :success
    json = JSON.parse(@response.body)
    assert_equal @reservation.id, json["id"]
  end
end
