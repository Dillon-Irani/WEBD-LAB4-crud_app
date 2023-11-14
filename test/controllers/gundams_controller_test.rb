require "test_helper"

class GundamsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @gundam = gundams(:one)
  end

  test "should get index" do
    get gundams_url
    assert_response :success
  end

  test "should get new" do
    get new_gundam_url
    assert_response :success
  end

  test "should create gundam" do
    assert_difference("Gundam.count") do
      post gundams_url, params: { gundam: { name: @gundam.name, scale: @gundam.scale, series: @gundam.series } }
    end

    assert_redirected_to gundam_url(Gundam.last)
  end

  test "should show gundam" do
    get gundam_url(@gundam)
    assert_response :success
  end

  test "should get edit" do
    get edit_gundam_url(@gundam)
    assert_response :success
  end

  test "should update gundam" do
    patch gundam_url(@gundam), params: { gundam: { name: @gundam.name, scale: @gundam.scale, series: @gundam.series } }
    assert_redirected_to gundam_url(@gundam)
  end

  test "should destroy gundam" do
    assert_difference("Gundam.count", -1) do
      delete gundam_url(@gundam)
    end

    assert_redirected_to gundams_url
  end
end
