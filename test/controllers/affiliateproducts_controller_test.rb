require 'test_helper'

class AffiliateproductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @affiliateproduct = affiliateproducts(:one)
  end

  test "should get index" do
    get affiliateproducts_url
    assert_response :success
  end

  test "should get new" do
    get new_affiliateproduct_url
    assert_response :success
  end

  test "should create affiliateproduct" do
    assert_difference('Affiliateproduct.count') do
      post affiliateproducts_url, params: { affiliateproduct: {  } }
    end

    assert_redirected_to affiliateproduct_url(Affiliateproduct.last)
  end

  test "should show affiliateproduct" do
    get affiliateproduct_url(@affiliateproduct)
    assert_response :success
  end

  test "should get edit" do
    get edit_affiliateproduct_url(@affiliateproduct)
    assert_response :success
  end

  test "should update affiliateproduct" do
    patch affiliateproduct_url(@affiliateproduct), params: { affiliateproduct: {  } }
    assert_redirected_to affiliateproduct_url(@affiliateproduct)
  end

  test "should destroy affiliateproduct" do
    assert_difference('Affiliateproduct.count', -1) do
      delete affiliateproduct_url(@affiliateproduct)
    end

    assert_redirected_to affiliateproducts_url
  end
end
