require 'test_helper'

class StoreControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_select 'li a', minimum: 2
    assert_select 'div h3', minimum: 3
    assert_select 'nav li', minimum: 2
    assert_select 'h1', 'Каталог'
    assert_select 'h3', '9,00 грн.'
  end

end
