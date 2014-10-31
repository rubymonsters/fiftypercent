class Admin::EventsControllerTest < ActionController::TestCase

  # this behavior here is inherited from Admin::BaseController
  test "should redirect to log_in_path if not logged in" do
    get :index
    assert_redirected_to log_in_path
  end

  test "should use the admin layout" do
    get :index, nil, user_id: users(:horst).id
    assert_template layout: 'admin'
  end



  test "should get index if logged in" do
    get :index, nil, user_id: users(:horst).id
    assert_template :index
  end

  test "should list events titles" do
    get :index, nil, user_id: users(:horst).id
    assert_select 'li', /^CeBi/
  end

end