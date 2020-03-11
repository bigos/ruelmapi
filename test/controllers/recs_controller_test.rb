require 'test_helper'

class RecsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @rec = recs(:one)
  end

  test "should get index" do
    get recs_url
    assert_response :success
  end

  test "should get new" do
    get new_rec_url
    assert_response :success
  end

  test "should create rec" do
    assert_difference('Rec.count') do
      post recs_url, params: { rec: { time: @rec.time, tip: @rec.tip, value: @rec.value } }
    end

    assert_redirected_to rec_url(Rec.last)
  end

  test "should show rec" do
    get rec_url(@rec)
    assert_response :success
  end

  test "should get edit" do
    get edit_rec_url(@rec)
    assert_response :success
  end

  test "should update rec" do
    patch rec_url(@rec), params: { rec: { time: @rec.time, tip: @rec.tip, value: @rec.value } }
    assert_redirected_to rec_url(@rec)
  end

  test "should destroy rec" do
    assert_difference('Rec.count', -1) do
      delete rec_url(@rec)
    end

    assert_redirected_to recs_url
  end
end
