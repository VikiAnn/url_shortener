require 'test_helper'

class RedirectControllerTest < ActionDispatch::IntegrationTest
  setup do
    @link = links(:one)
  end

  test "should get index" do
    get "/#{@link.hashid}"
    assert_response :redirect
    assert response.redirect_url == @link.uri
  end

  test "should 404" do
    assert_raises ActiveRecord::RecordNotFound do
      get "/asdf"
    end
  end
end
