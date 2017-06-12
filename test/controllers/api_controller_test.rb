require 'test_helper'

class ApiControllerTest < ActionController::TestCase
  test "should get process_crawl_data" do
    get :process_crawl_data
    assert_response :success
  end

end
