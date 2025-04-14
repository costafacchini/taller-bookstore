require "test_helper"

class BooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @book = books(:one)
    @user = users(:one)
  end

  test "should get index" do
    get books_url, as: :json
    assert_response :success
  end

  test "should create book" do
    assert_difference("Book.count") do
      post books_url, params: { book: { status: @book.status, title: @book.title } }, as: :json
    end

    assert_response :created
  end

  test "should show book" do
    get book_url(@book), as: :json
    assert_response :success
  end

  test "should update book" do
    patch book_url(@book), params: { book: { status: @book.status, title: @book.title } }, as: :json
    assert_response :success
  end

  test "should destroy book" do
    Reservation.destroy_all

    assert_difference("Book.count", -1) do
      delete book_url(@book), as: :json
    end

    assert_response :no_content
  end

  test "should create a reservation" do
    assert_difference("Reservation.count") do
      post book_reserve_url(@book), params: { book: { user_id: @user.id } }, as: :json
    end

    assert_response :created
    @book.reload
    assert_equal "reserved", @book.status
  end

  test "should not allow if the book is already reserved" do
    @book.reserved!
    assert_no_difference("Reservation.count") do
      post book_reserve_url(@book), params: { book: { user_id: @user.id } }
    end

    assert_response :unprocessable_entity
    assert_includes @response.body, "Book is already reserved"
  end
end
