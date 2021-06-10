require "test_helper"

class TiendasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tienda = tiendas(:one)
  end

  test "should get index" do
    get tiendas_url
    assert_response :success
  end

  test "should get new" do
    get new_tienda_url
    assert_response :success
  end


  test "should show tienda" do
    get tienda_url(@tienda)
    assert_response :success
  end

  test "should get edit" do
    get edit_tienda_url(@tienda)
    assert_response :success
  end


end
