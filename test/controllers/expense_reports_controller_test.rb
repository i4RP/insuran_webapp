require 'test_helper'

class ExpenseReportsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get expense_reports_index_url
    assert_response :success
  end

  test "should get new" do
    get expense_reports_new_url
    assert_response :success
  end

  test "should get create" do
    get expense_reports_create_url
    assert_response :success
  end

end
