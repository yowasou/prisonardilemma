require "test_helper"

class PrisonarsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @prisonar = prisonars(:one)
  end

  test "should get index" do
    get prisonars_url
    assert_response :success
  end

  test "should get new" do
    get new_prisonar_url
    assert_response :success
  end

  test "should create prisonar" do
    assert_difference('Prisonar.count') do
      post prisonars_url, params: { prisonar: { code: @prisonar.code, lose_count: @prisonar.lose_count, name: @prisonar.name, win_count: @prisonar.win_count } }
    end

    assert_redirected_to prisonar_url(Prisonar.last)
  end

  test "should show prisonar" do
    get prisonar_url(@prisonar)
    assert_response :success
  end

  test "should get edit" do
    get edit_prisonar_url(@prisonar)
    assert_response :success
  end

  test "should update prisonar" do
    patch prisonar_url(@prisonar), params: { prisonar: { code: @prisonar.code, lose_count: @prisonar.lose_count, name: @prisonar.name, win_count: @prisonar.win_count } }
    assert_redirected_to prisonar_url(@prisonar)
  end

  test "should destroy prisonar" do
    assert_difference('Prisonar.count', -1) do
      delete prisonar_url(@prisonar)
    end

    assert_redirected_to prisonars_url
  end
end
