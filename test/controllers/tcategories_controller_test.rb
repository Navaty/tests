require 'test_helper'

class TcategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tcategory = tcategories(:one)
  end

  test "should get index" do
    get tcategories_url
    assert_response :success
  end

  test "should get new" do
    get new_tcategory_url
    assert_response :success
  end

  test "should create tcategory" do
    assert_difference('Tcategory.count') do
      post tcategories_url, params: { tcategory: { description: @tcategory.description, title: @tcategory.title } }
    end

    assert_redirected_to tcategory_url(Tcategory.last)
  end

  test "should show tcategory" do
    get tcategory_url(@tcategory)
    assert_response :success
  end

  test "should get edit" do
    get edit_tcategory_url(@tcategory)
    assert_response :success
  end

  test "should update tcategory" do
    patch tcategory_url(@tcategory), params: { tcategory: { description: @tcategory.description, title: @tcategory.title } }
    assert_redirected_to tcategory_url(@tcategory)
  end

  test "should destroy tcategory" do
    assert_difference('Tcategory.count', -1) do
      delete tcategory_url(@tcategory)
    end

    assert_redirected_to tcategories_url
  end
end
