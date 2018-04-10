require 'test_helper'

class AvailablesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get availables_index_url
    assert_response :success
  end

  test "should get show" do
    get availables_show_url
    assert_response :success
  end

  test "should get new" do
    get availables_new_url
    assert_response :success
  end

  test "should get create" do
    get availables_create_url
    assert_response :success
  end

  test "should get edit" do
    get availables_edit_url
    assert_response :success
  end

  test "should get update" do
    get availables_update_url
    assert_response :success
  end

  test "should get destroy" do
    get availables_destroy_url
    assert_response :success
  end

end
