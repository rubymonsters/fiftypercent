require 'test_helper'

class Admin::CommentsControllerTest < ActionController::TestCase
  test "index should list comment titles" do
    get :index, session: { user_id: users(:horst).id }
    assert_select 'table' do
      assert_select  'td', /Comment\ One/
    end
  end

  test "@commentable is not set if there are no fitting parameters" do
    get :index, session: { user_id: users(:horst).id }
    assert_nil assigns[:commentable]
  end

  test "index finds a commentable give the right parameters" do
    params = {
      commentable_id: events(:car_show).id,
      commentable_type: 'Event'
    }
    get :index, params: params, session: { user_id: users(:horst).id }
    assert_equal events(:car_show).id, assigns[:commentable].id
  end

  test "if we have a commentable, @comments are only the comments belonging to this commentable." do
    params = {
      commentable_id: events(:car_show).id,
      commentable_type: 'Event'
    }
    get :index, params: params, session: { user_id: users(:horst).id }
    assert_equal 2, assigns[:comments].size
  end
end
