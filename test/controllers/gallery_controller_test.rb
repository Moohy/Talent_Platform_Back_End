require 'test_helper'

class GalleryControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get gallery_create_url
    assert_response :success
  end

  test "should get edit" do
    get gallery_edit_url
    assert_response :success
  end

  test "should get update" do
    get gallery_update_url
    assert_response :success
  end

  test "should get destroy" do
    get gallery_destroy_url
    assert_response :success
  end

end
