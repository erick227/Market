require 'test_helper'

class TemplatesControllerTest < ActionController::TestCase
  #test template with no params gives 404 error
  test "test root template" do
    get(:root, {'template' => ""})
    assert_response :missing
  end

  #test template with non empty param gives 200 status code with non empty page
  test "test library template" do
    get(:root, {'template' => "library"})
    assert_response :success
    assert_template :library
  end
  test "test media template" do
    get(:root, {'template' => "media"})
    assert_response :success
    assert_template :media
  end
  test "test menu" do
    get(:root, {'template' => "menu"})
    assert_response :success
    assert_template :menu
  end
end
