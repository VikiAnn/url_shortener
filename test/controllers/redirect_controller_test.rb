require 'test_helper'

class RedirectControllerTest < ActionDispatch::IntegrationTest
  setup do
    @link = links(:one)
  end

  test "should get index" do
    get shorter_url_url(@link.hashid)
    assert_response :redirect
    assert response.redirect_url == @link.uri
  end

  test "should 404" do
    assert_raises ActiveRecord::RecordNotFound do
      get shorter_url_url("asdf")
    end
  end
end
