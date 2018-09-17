require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  # create action
  test "should log a user in if pw is valid" do
    post :create, params: { email: 'horst@mail.com', password: 'geheim' }
    assert_equal session[:user_id], users(:horst).id
    assert_match /Logged\ in/, flash[:success] # !> ambiguous first argument; put parentheses or even spaces
    assert_redirected_to admin_root_path
  end

  test "should NOT log a user in if pw is NOT valid" do
    post :create, params: { email: 'horst@mail.com', password: 'nicht_das_password' }
    assert_not session[:user_id]
    assert_match /Invalid/, flash[:alert] # !> ambiguous first argument; put parentheses or even spaces
    assert_template :new
  end

  # destroy action

  test "calling destroy action logs the user out" do
    get :destroy, session: { user_id: users(:horst).id }
    assert_not session[:user_id]
    assert_match /Logged\ out/, flash[:success] # !> ambiguous first argument; put parentheses or even spaces
    assert_redirected_to root_path
  end

end
