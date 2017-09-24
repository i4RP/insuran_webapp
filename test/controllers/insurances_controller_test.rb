require 'test_helper'

class InsurancesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get insurances_index_url
    assert_response :success
  end

  test "should get new" do
    get insurances_new_url
    assert_response :success
  end

  test "should get create" do
    get insurances_create_url
    assert_response :success
  end

end
