require 'test_helper'

class HollasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @holla = hollas(:one)
  end

  test "should get index" do
    get hollas_url
    assert_response :success
  end

  test "should get new" do
    get new_holla_url
    assert_response :success
  end

  test "should create holla" do
    assert_difference('Holla.count') do
      post hollas_url, params: { holla: { user_id: @holla.user_id, username: @holla.username } }
    end

    assert_redirected_to holla_url(Holla.last)
  end

  test "should show holla" do
    get holla_url(@holla)
    assert_response :success
  end

  test "should get edit" do
    get edit_holla_url(@holla)
    assert_response :success
  end

  test "should update holla" do
    patch holla_url(@holla), params: { holla: { user_id: @holla.user_id, username: @holla.username } }
    assert_redirected_to holla_url(@holla)
  end

  test "should destroy holla" do
    assert_difference('Holla.count', -1) do
      delete holla_url(@holla)
    end

    assert_redirected_to hollas_url
  end
end
