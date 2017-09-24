require 'test_helper'

class BuyInsesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get buy_inses_new_url
    assert_response :success
  end

  test "should get create" do
    get buy_inses_create_url
    assert_response :success
  end

end
