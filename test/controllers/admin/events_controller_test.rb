require 'test_helper'

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

  test "should list unpublished events titles" do
    get :index, nil, user_id: users(:horst).id
    assert_select '#unpublished-events' do
      assert_select  'td', /CeBi/
    end
  end

  test "should list published events titles" do
    get :index, nil, user_id: users(:horst).id
    assert_select '#published-events' do
      assert_select  'td', /Carshow/
    end
  end


  test "publish-method publishes an event" do
    assert_difference 'Event.published.count'  do
      post :publish, {id: events(:cebit).id}, {user_id: users(:horst).id}
    end
    assert_redirected_to admin_events_path
  end

  test "unpublish-method un-publishes an event" do
    assert_difference 'Event.unpublished.count' do
      post :unpublish, {id: events(:car_show).id}, {user_id: users(:horst).id}
    end
    assert_redirected_to admin_events_path
  end

end