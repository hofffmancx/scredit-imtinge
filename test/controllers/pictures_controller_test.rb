require 'test_helper'

class PicturesControllerTest < ActionDispatch::IntegrationTest
  test "should get upload" do
    get pictures_upload_url
    assert_response :success
  end

end
