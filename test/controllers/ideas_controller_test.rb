require 'test_helper'

class IdeasControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test "should go to the ideas path" do
    get '/ideas'
    assert_response :success
  end

  test "should show ideas" do
    get '/ideas'
    assert_equal "index", @controller.action_name
@request.media_type
    assert_match "Ideas", @response.body
  end
end
